Para estructurar este Trabajo Práctico de manera profesional y garantizar que el código sea verdaderamente portable, el proyecto debe dividirse en la configuración del hardware, el diseño del comportamiento (máquina de estados) y la separación de la capa de abstracción en C.

## 1. System Setup (Configuración del Hardware)

El objetivo aquí es definir cómo interactuará físicamente el microcontrolador (como un STM32F103) con el display (típicamente un controlador HD44780).

* **Selección del Bus:** Debes definir si el display operará en modo de 8 bits, 4 bits o mediante un expansor I2C (como el PCF8574). El modo de 4 bits es el estándar en sistemas embebidos sin I2C porque ahorra pines, requiriendo solo 6 GPIOs (RS, EN, y D4-D7).
* **Asignación de Pines (Pinout):** Configura los pines del microcontrolador como salidas digitales (Push-Pull). Si estás documentando el setup, incluye una tabla de ruteo que mapee los pines del MCU a los pines del LCD.
* **Base de Tiempo:** El protocolo del LCD requiere el cumplimiento estricto de tiempos (delays en microsegundos y milisegundos) entre las transiciones de las señales, especialmente para el pin EN (Enable). Configura un timer en el microcontrolador que te sirva como base de tiempo precisa o para alimentar la máquina de estados.

## 2. Statechart (Modelado de Estados)

Para evitar usar funciones de retardo bloqueantes que congelen la ejecución de otras tareas, el driver debe diseñarse como una Máquina de Estados Finitos (FSM) no bloqueante.

El modelo básico de estados debería incluir:

* **`POWER_ON_DELAY`**: Al encender el sistema, el estado inicial simplemente espera entre 40ms y 50ms para permitir que el voltaje del display se estabilice antes de recibir comandos.
* **`INIT_SEQUENCE`**: Ejecuta los comandos rígidos de configuración (por ejemplo, enviar el comando `0x03` tres veces seguido de `0x02` para forzar el modo de 4 bits, seguido de la configuración de líneas y fuente).
* **`IDLE`**: El estado de reposo. El sistema monitorea continuamente si hay nuevos caracteres o comandos en el buffer de transmisión listos para ser enviados.
* **`WRITE_NIBBLE_HIGH` / `WRITE_NIBBLE_LOW**`: Si usas un bus de 4 bits, enviar un byte requiere dos ciclos. Estos estados preparan los primeros 4 bits en las salidas, generan el pulso en el pin EN, y luego repiten el proceso para los 4 bits restantes.
* **`WAIT_BUSY`**: Tras enviar un comando, el sistema ingresa a este estado durante un tiempo predeterminado (ej. 2ms para el comando *Clear Display* o 50µs para caracteres normales) o consultando el *Busy Flag* del LCD si el pin R/W está conectado.

## 3. C Coding (Implementación y Porting)

Para cumplir con el requerimiento de "porting", el código en C **nunca** debe tener llamadas directas a registros específicos del microcontrolador dentro de la lógica del display. Debes dividir el código en dos módulos:

**A. Capa dependiente del hardware (`lcd_port.c` / `lcd_port.h`)**
Este archivo contendrá las únicas funciones que saben de qué microcontrolador se trata. Si mañana cambias de arquitectura, solo reescribes este archivo.

```c
// Funciones "Wrapper" que envuelven el comportamiento del hardware
void LCD_Port_SetPin_RS(uint8_t state) {
    // Código específico de tu MCU (ej. manipular GPIOA->BSRR)
}

void LCD_Port_SetDataNibble(uint8_t nibble) {
    // Escribir los 4 bits en los pines D4 a D7 correspondientes
}

uint32_t LCD_Port_GetTicks(void) {
    // Retorna el tiempo actual del sistema (ej. un systick)
}

```

**B. Capa central y lógica de estados (`lcd_core.c` / `lcd_core.h`)**
Este archivo está escrito en C estándar puro. Implementa el statechart llamando exclusivamente a las funciones del archivo `lcd_port`.

```c
typedef enum {
    STATE_STARTUP_DELAY,
    STATE_INIT,
    STATE_IDLE,
    STATE_SEND_HIGH,
    STATE_SEND_LOW
} LCD_State_t;

void LCD_Task(void) {
    static LCD_State_t current_state = STATE_STARTUP_DELAY;
    static uint32_t timestamp = 0;

    switch(current_state) {
        case STATE_STARTUP_DELAY:
            if (LCD_Port_GetTicks() - timestamp > 40) {
                current_state = STATE_INIT;
            }
            break;
        case STATE_INIT:
            // Ejecutar la rutina de configuración llamando a LCD_Port_SetPin_RS, etc.
            break;
        // ...resto de los estados
    }
}

```

El código fuente proporcionado implementa un sistema embebido "Bare Metal" basado en tareas disparadas por eventos (Event-Triggered System), diseñado para gestionar de forma concurrente y no bloqueante la lógica de pruebas y la actualización física de una pantalla LCD.

## Arquitectura del Sistema y Módulos

* **app.c y app_it.c**: Constituyen el núcleo del sistema de tareas. `app.c` inicializa las tareas y contiene el bucle principal (`app_update`), el cual ejecuta las funciones `update` de cada tarea y calcula sus métricas de rendimiento (como los tiempos de ejecución en el mejor y peor caso). `app_it.c` gestiona las rutinas de servicio de interrupción (ISR), incrementando los contadores de tiempo del sistema a través de las interrupciones del SysTick.


* **systick.c**: Proporciona funciones de temporización del hardware central, específicamente un retardo bloqueante en microsegundos (`systick_delay_us`) utilizando el contador del timer SysTick del microcontrolador.


* **task_test.c y task_test_attribute.h**: Implementan una tarea de prueba periódica. Mantienen configuraciones y variables de estado interno (como un temporizador `tick` y un contador general de ciclos) para generar datos y enviarlos hacia la tarea de la pantalla.


* **task_display_attribute.h**: Define las enumeraciones de estados (`ST_DSP_IDLE`, `ST_DSP_UPDATE`), eventos (`EV_DSP_IDLE`, `EV_DSP_UPDATE`), y la estructura de datos `task_display_dta_t`, que incluye una matriz `ddram` que funciona como buffer para 2 filas de 16 caracteres.


* **task_display_interface.c y task_display_interface.h**: Actúan como el puente de comunicación (API) entre cualquier tarea emisora y la tarea de visualización. Exponen la función `put_event_task_display`, que inyecta caracteres en la matriz `ddram` y activa la bandera (`flag`) indicando que hay una actualización pendiente.


* **task_display.c**: Inicializa y ejecuta la tarea de control general de la pantalla, manteniendo instanciada la estructura de datos principal y evaluando cuándo actualizar el hardware.


* **display.c y display.h**: Representan el controlador de bajo nivel de hardware (driver) para una pantalla LCD compatible con el controlador HD44780. Manejan las secuencias de pulsos en los pines GPIO, configurando la comunicación en 4 u 8 bits y enviando comandos o caracteres individuales.



## Comportamiento de `task_test_statechart(void)`

Esta función actúa como el núcleo lógico de la tarea de prueba y opera en base a decrementos de tiempo:

* En cada ejecución, incrementa la variable `counter`, la cual registra el total de ciclos de actualización de la tarea.


* Comprueba una variable temporizadora interna (`tick`). Si es mayor a su valor mínimo (`DEL_TEST_XX_MIN`), la decrementa.


* Cuando el temporizador se agota, se reinicia asignándole su valor máximo (`DEL_TEST_XX_MAX`).


* Inmediatamente después del reinicio, utiliza la función `put_event_task_display` para enviar la cadena base "Test Nro: ******" a la fila 1 de la pantalla.


* Calcula el número de prueba en curso dividiendo el `counter` total entre `DEL_TEST_XX_MAX`, lo formatea a una cadena de texto usando `snprintf`, y lo inyecta dinámicamente en la columna 10, fila 1 de la pantalla.



## Comportamiento de `task_display_statechart(void)`

Esta función implementa una Máquina de Estados Finitos (FSM) no bloqueante diseñada para volcar la memoria RAM interna hacia el hardware de la pantalla sin detener la ejecución del resto del sistema. Opera de la siguiente manera:

* **Estado ST_DSP_IDLE (Reposo)**: La tarea monitorea permanentemente las variables de control. Si detecta que la variable booleana `flag` es verdadera (`true`) y el evento actual es igual a `EV_DSP_UPDATE`, realiza una transición de estado hacia `ST_DSP_UPDATE`.


* **Estado ST_DSP_UPDATE (Actualización)**: Se encarga del refresco físico de los caracteres. Primero, apaga la bandera (`flag = false`). Luego, posiciona el cursor físico del hardware en la coordenada de inicio de la primera fila y escribe secuencialmente la información almacenada en el índice 0 del buffer `ddram`.


* A continuación, mueve el cursor al inicio de la segunda fila y repite el proceso volcando el contenido del índice 1 del buffer `ddram`. Una vez completada la transmisión a ambas filas, el sistema retorna automáticamente al estado `ST_DSP_IDLE`.


* **Condición por defecto**: Si ocurre una desincronización y la máquina entra en un estado no reconocido, restablece de manera segura el evento a `EV_DSP_IDLE`, el estado a `ST_DSP_IDLE`, el retardo a `DEL_DSP_MIN` y limpia la bandera de eventos.


Tarea,Índice,NOE (Ejecuciones),LET (µs),BCET (µs),WCET (µs)
task_test,task_dta_list[0],278373,2,2,37
task_display,task_dta_list[1],278375,2,2,6207
