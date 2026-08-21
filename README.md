# AdC_2026

Repo de las actividades individuales que vayamos a ir haciendo en la materia

## Guia de como usar vivado primero!

### Hacer un componente nuevo:

- Abrir vivado
- Add sources (Alt + A)
- Create design sources (segunda opcion)
- Create file (abajo a la derecha)
- Cambiar file type a **System Verilog**
- Copypastear el nombre del practico o del lab del componente
- Finish
- Programar el componente en si (el "nombre del componente".sv)
- Programar el test bench del componente (el "nombre del componente"++"_tb".sv)
  - Instanciar el componente
  - Crear la tabla de preueba con los valores significativos
- Correr el linter (a la izquierda)
- Correr la simulacion comportamental (checkear que los valores den!)
- Repetir!

### Como programar como un PRO!

- cosas basicas:
  -
  - TODO USA **begin ... end** (no llaves)
  - ***`if() else if() else`*** van adentro de un **`always`**
  - **input|output** **logic** ***[optional]*** **name** 
  - la cartilla de legv8 tiene utilidad kekw
  - para **numeros/constantes** se usa `size ' num_type number`
  - para **variables** se usa `#(parameter nombre = numero)`
  - 