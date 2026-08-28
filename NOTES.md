# NOTAS DE CLASE

## 28/8 

### CPU architecture


1 ciclo de momento es 1 subida y bajada (duh) flanco asc marca el inicio
ciclos de un cpu? + mejor hz
etapas de una instruccion (se intenta que se hagan las instr en 1 solo ciclo)
- if: instr fetch 
  - time to fetch (Tf)
- id: instruc decode & reg read
  - time to decode (Td)
- ex: execute
  - (Te)
- mem: access memory operand
  - time to fetch mem dat (Tmd)
- wb: write res to mem

El tiempo minimo de un procesador tiene que ser del mismo caso que el peor caso de tiempo de una instruccion (**camino critico = suma de todas las latencias**)


pero que pasa con instrucciones que sean mas cortas que ese clock?


el procesador no puede cambiar el tiempo de clock

asi que igualmente instrucciones mas chicas ocupan 1 ciclo de clk

aca es donde entra el **piping** para hacerlo mas rapido
### Piping

no todas las partes del procesador se usan en todas las etapas de una instruccion entonces

podemos usar ese modulo que esta al dope haciendo otra instruccion mientras! haciendo capaz hasta 5 instrucciones mientras se termina de hacer 1!!!

el output aumenta (en eficiencia de tiempo) de 1 instruccion por ciclo a 1 instruccion por cada latencia de la primera instruccion (de forma puuuuramente teorica)

eso si, para ejecutar la instruccion por primera vez, el primer output sale 1 ciclo despues y el resto cada 1/5 de ciclo recien

formula de ganancia de eficiencia ***Tp = K * T_reloj_cpu + (n-1) * T_reloj_cpu***

ganancia de velocidad ***Ganancia = (T_sin_pipeline)/(T_con_pipeline) = K*(aprox)**

ej de filmina, instruccion mas costosa 800ps => 1 ciclo = 800ps. Si implemento pipelining la siguiente instruccion tardaria en empezarse 200ps (porque eso tarda el instr fetch)

una de las mejoras de pipeline es que es que si mejoras el fetch nomas, ya tenes ganancias o solo capaz en ciclos nmas cortos sino que en menor latencia a la hora de lanzar mas instrucciones en paralelo. El tema es que necesitamos mas ancho de banda para esta mejora de x5 en cantidad de intrucciones

cisc no es pipelineable y risc si (depende la instruccion

en los peligros de o problemas de intentar pipelinear serian las alineaciones de instrucciones (capaz 2 instrucciones quieran acceder a la misma memoria a la vez ergo race conditions).**DATA HAZARD**: Intrcciones que necesiten a lo mejor la primera instruccion terminada para poder hacerse de forma correcta

### Forwading(Bypassing)

envez de guardar el resultado en memoria, lo pasas derecho a la siguiente entrada de instruccion (ergo, le pasas un cable desde la salida de la alu al input de la alu). Ayuda a resolver un poco el problema de data hazard. Pero no por completo si aun ni se hizo el calculo y ya se necesita