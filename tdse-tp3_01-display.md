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

Para darte el código exacto de inicialización, ¿estás utilizando un módulo adaptador I2C soldado al display, o vas a conectar los pines de datos directamente a los puertos GPIO del microcontrolador?
