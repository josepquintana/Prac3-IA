# Prac3-IA
Práctica de Planificación - IA


### Execution
`./bin/ff  -o domain.pddl -f problem.pddl` _[Fast Forward]_  
`./bin/mff -o domain.pddl -f problem.pddl` _[Metric Fast Forward]_

### INFO
Asumiremos que en un problema tendremos un conjunto de rovers aparcados en bases (pueden
ser más de uno y no tienen porque estar en el mismo sitio), hay un conjunto de peticiones hechas
por los asentamientos tanto de personal especializado como de suministros y hay personal disponible
en asentamientos y suministros en los almacenes esperando para ser transportados. 

El número de peticiones de cada cosa es igual o mayor a lo que está disponible.
Nada impide que un rover cargue y descargue varias veces en su recorrido.

- **Nivel básico:**  
  Se realiza el transporte de todos los suministros y personal para cubrir las
  peticiones que se puedan cubrir con lo que hay disponible. No hay limitación para la capacidad
  de carga de los rovers y pueden transportar a la vez tantos suministros y personal como quieran.
  
- **Extensión 1:**   
  Los rovers pueden transportar a la vez un máximo de dos personas o una carga
  de suministros (no se pueden mezclar personas y suministros).
  
- **Extensión 2:**   
  Extensión 1 + Los rovers tienen una capacidad de combustible que se carga
  al principio del día, de manera que solo pueden hacer un número limitado de movimientos.
  En cada desplazamiento entre dos bases el rover gasta una unidad de combustible. Haced una
  versión en la que no importe cuanto combustible gastan en total los rovers mientras hagan las
  entregas y otra en la que se minimice el combustible total gastado para poder comparar las
  soluciones.
  
- **Extensión 3:**  
  Extensión 2 + las peticiones tienen una prioridad 1, 2 o 3 (siendo 3 la máxima)
  de manera que buscamos el plan que maximice la prioridad de las peticiones servidas. Haced
  una versión en la que no importe el total de combustible gastado y otra en la que se optimice
  una combinación entre prioridades y combustible total en la que se puedan asignar diferentes
  pesos a cada criterio para poder comparar las soluciones.
