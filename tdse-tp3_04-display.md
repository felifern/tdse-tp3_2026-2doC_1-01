**Unidad de medida:** Microsegundos ($\mu\text{s}$) / Ciclos de reloj del contador DWT.

| Tarea (`task_dta_list[index]`) | `NOE` (Número de Ejecuciones) | `LET` (Último Tiempo) | `BCET` (Mejor Tiempo) | `WCET` (Peor Tiempo) |
| --- | --- | --- | --- | --- |
| **`task_dta_list[0]`**<br> | 371433

 | 12

 | 12

 | **14**<br> |
| **`task_dta_list[1]`**<br> | 371436

 | 3

 | 3

 | **152**<br> |
| **`task_dta_list[2]`**<br> | 371441

 | 3

 | 2

 | **4**<br> |
| **`task_dta_list[3]`**<br> | 371445

 | 2

 | 2

 | **78**<br> |

---

### 2. Análisis del Cumplimiento de Restricciones Temporales

Para verificar si el sistema cumple con las restricciones del **ejecutor cíclico**:

1. **Tiempo Disponible por Slot (Systick):** $1\text{ ms} = 1000\ \mu\text{s}$.
2. **Peor Caso Total ($\sum \text{WCET}$):**

$$\text{WCET}_{\text{total}} = 14 + 152 + 4 + 78 = 248\ \mu\text{s}$$


3. **Carga de CPU en Peor Caso:**

$$\text{Carga} = \frac{248\ \mu\text{s}}{1000\ \mu\text{s}} \times 100\% = 24.8\%$$



#### Conclusión del Análisis:

* **Cumple holgadamente:** El peor tiempo de ejecución total de todas las tareas en un ciclo ($248\ \mu\text{s}$) es notablemente menor al período del ejecutor cíclico ($1000\ \mu\text{s}$).
* **Margen de seguridad:** Existe un **$75.2\%$ de tiempo ocioso (idle)**, lo que garantiza determinismo absoluto, evita sobrepasos de ventana temporal (*deadline miss*) y asegura la correcta atención del menú de usuario y refresco de pantalla sin retrasar la arquitectura del sistema.

