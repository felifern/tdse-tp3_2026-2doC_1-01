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

### Justificación
El tiempo máximo de ejecución de la tarea del display (WCET = 221 us) es significativamente menor al período del ejecutor cíclico (1000 us / 1 ms). La implementación mediante diagrama de estados garantiza un código no bloqueante al procesar un único dato/instrucción por ciclo, cumpliendo holgadamente con las restricciones temporales del sistema embebido.
