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

**N = cantidad de instrucciones**

formula de ganancia de eficiencia ***Tp = K * T_reloj_cpu + (n-1) * T_reloj_cpu***

ganancia de velocidad ***Ganancia = (T_sin_pipeline)/(T_con_pipeline) = K*(aprox)**

ej de filmina, instruccion mas costosa 800ps => 1 ciclo = 800ps. Si implemento pipelining la siguiente instruccion tardaria en empezarse 200ps (porque eso tarda el instr fetch)

una de las mejoras de pipeline es que es que si mejoras el fetch nomas, ya tenes ganancias o solo capaz en ciclos nmas cortos sino que en menor latencia a la hora de lanzar mas instrucciones en paralelo. El tema es que necesitamos mas ancho de banda para esta mejora de x5 en cantidad de intrucciones

cisc no es pipelineable y risc si (depende la instruccion

en los peligros de o problemas de intentar pipelinear serian las alineaciones de instrucciones (capaz 2 instrucciones quieran acceder a la misma memoria a la vez ergo race conditions).**DATA HAZARD**: Intrcciones que necesiten a lo mejor la primera instruccion terminada para poder hacerse de forma correcta

### Forwading(Bypassing)

envez de guardar el resultado en memoria, lo pasas derecho a la siguiente entrada de instruccion (ergo, le pasas un cable desde la salida de la alu al input de la alu). Ayuda a resolver un poco el problema de data hazard. Pero no por completo si aun ni se hizo el calculo y ya se necesita.

Aun con forwarding a veces hay que stallear los accesos a memoria/escrituras a memoria

## 2/9 Hazards

### Stalling

Stallear es importante porque sino no hay forma de prevenir los memory hazards que se pueden generar aun con forwarding, en este caso cuando X instruccion se ejecute si esta es una de las que puede generar un memory hazard hace que si los registros involucrados aparecen en una de las siguientes operaciones, se stallea la siguiente instruccion

### Control Hazard

### Interfaces

vieja arquitectura tenia 1 puerto directo del procesador al dispositivo(incluyendo memorias?), actualmente tenes una memoria de por medio y le clavas un bus directo(realmente se ve como una matriz configurable, pero es un simple detalle) al cpu y despues cada entrada tiene un modulo para paralelizarla. 

Standar i/o va a memoria si el cable M/IO == 0 y i/o si es 1, devuelve palabra de 1 byte!(intel x86 la usa(las instrucciones de acceso a memoria y i/o son distintas ldurio y ldur normal no hacen lo mismo!) La otra forma es la memory-mapped, que la i/o esta en memoria entonces es buscarla en la region de memoria que se encargue de i/o(arm y arquis actuales la usan(existe solo un metodo de acceso a ambos, ldur etc.)). El espacio direccionable es el mismo, pero uno hace las cosas por hardware y complejizando sus instrucciones y cpu y la otra todo lo contrario.

Dependiendo el modulo que uno quiera usar de i/o se pueden usar distintos sistemas de Operarlos; 

 - Polling device 
- Interruption driven 
- Direct Memory Access


Capaz una grafica necesita mas bien usar DMA pero un teclado polling.

#### Polling

Polling consume mucho en ciclos de procesador, muucho tiempo esperando nada y haciendo preguntas al dope, la ventaja es el syncronismo(ejemplo, grabar audio, siempre pregunta si sigue grabando audio y mandando samples de sonido). Polling claramente es muy efectivo en latencias para la i/o(lit hay un cable/senial de hw de interrupcion) pero literalmente matas al resto de cosas a la mitad.

#### Interrupciones

Si hay interrupcion, el procesador busca en el **vector de interrupciones** el codigo que tiene que correr, este proceso/codigo de interrupcion se llama **ISR(Interruption Service Routine)**. Este vector de interrupciones tiene un lugar fijado en sistemas chicos y en sistemas modernos y mas grandes se usa vecotrizado sobre la memoria y se le agrega un ack para confirmar que la interrupcion sea resuelta? (matar un programa corta directamente el acceso/escritura a memoria por ejemplo). 

Existen interrupciones enmascarables y no enmascarables, las enmascarables es basicamente ignorables, las otras obviamente lo opuesto, se las suele llamar traps a las de este segundo tipo (tambien todo lo que sean exceptions, estan mapeadas fisicamente en el hw y no es de i/o sino de errores dentro del cpu). Que pasa si hay muchas interrupciones a la vez? hacemos un arbitraje. Este arbitraje sigue el orden de prioridades de interrupciones y para los de menor categoria un orden de "tiempo" en el que segun en que orden lei la interrupcion (software polling). El arbitro es un modulo de hw que tiene mapeado donde esta cada isr en el vector de interrupciones. 

Vamos a tener un registro extra para guardar el pc cuando haya excepciones (ELR exception link register), tambien vamos a tener una contabilidad de excepciones y log de las mismas en un (ESR). 

Checkear las filminas por las modificaciones a la ISA
