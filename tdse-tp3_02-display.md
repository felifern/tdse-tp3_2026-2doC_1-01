## Análisis de Restricciones Temporales

### Valores medidos en `task_dta_list` (Unidad: us)

- **task_dta_list[0] (task_test):**
  - NOE: 11221
  - LET: 2 us
  - BCET: 2 us
  - WCET: 36 us

- **task_dta_list[1] (task_display):**
  - NOE: 11225
  - LET: 2 us
  - BCET: 2 us
  - WCET: 221 us

### Justificación y Cumplimiento de Restricciones
El tiempo del peor caso global ($\text{WCET}_{\text{total}}$) dentro del ejecutor cíclico se calcula como la suma de los peores tiempos de ejecución individuales de todas las tareas configuradas en el sistema:

$\text{WCET}_{\text{total}} = \text{WCET}_{\text{task\_test}} + \text{WCET}_{\text{task\_display}} = 36\,\mu\text{s} + 221\,\mu\text{s} = 257\,\mu\text{s}$

El ejecutor cíclico opera con una ventana de tiempo o slot temporal de $1\text{ ms}$ ($1000\,\mu\text{s}$). Como el peor escenario de ejecución consumirá $257\,\mu\text{s}$, se cumple que:

$$\text{WCET}_{\text{total}} < 1000\,\mu\text{s}$$

Esto representa un uso máximo del procesador del $25,7\%$ en el peor momento posible. La implementación del diagrama de estados procesando $1$ sola instrucción o dato por ciclo es no bloqueante, liberando la CPU a tiempo para garantizar el cumplimiento de todas las restricciones temporales del ejecutor cíclico.
