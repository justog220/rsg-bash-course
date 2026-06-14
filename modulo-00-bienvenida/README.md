# Módulo 00: Bienvenida

## Antes de empezar

Si al leer palabras como `Linux`, `terminal` o `Bash` sentís que todo suena un poco abstracto, está bien. La meta de esta parte no es memorizar definiciones, sino empezar a ubicar qué pieza cumple cada cosa.

Al final del módulo debería quedar clara esta idea general:

- el sistema operativo es el entorno donde trabajamos
- la terminal es una forma de interactuar con ese entorno
- Bash es una de las herramientas que interpreta lo que escribimos
- todo esto resulta útil cuando trabajamos con muchos archivos y tareas repetitivas




## ¿Qué hace un sistema operativo?

Un sistema operativo es la capa que permite que una computadora funcione de forma usable: administra archivos, memoria, programas y la comunicación con el hardware.

Dicho más simple, es lo que hace posible abrir programas, guardar archivos, ejecutar herramientas y organizar el trabajo diario. Sin sistema operativo, no tendríamos una forma práctica de interactuar con la máquina.

## ¿Qué son Unix y Linux?

Unix es una familia de sistemas operativos que influyó muchísimo en la forma en que hoy se trabaja en servidores, investigación y programación. Linux toma muchas de esas ideas y es, en la práctica, el entorno con el que más te vas a cruzar en bioinformática.

Cuando hablamos de Linux, en realidad solemos hablar de distribuciones: variantes del sistema que empaquetan herramientas y decisiones distintas. Algunas distribuciones muy conocidas son [Ubuntu](https://ubuntu.com/), [Debian](https://www.debian.org), [Fedora](https://fedoraproject.org/es/) o [Linux Mint](https://linuxmint.com/).

> [!NOTE]
> Linux tiene muchísimas distribuciones y variantes. Si querés ver la escala real del ecosistema, podés mirar esta [línea de tiempo histórica de distribuciones Linux](https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg).

## ¿Qué es la terminal?

La terminal es una forma de interactuar con el sistema operativo escribiendo texto. En vez de hacer clic sobre botones o carpetas, damos instrucciones con comandos y recibimos una salida.

Por ejemplo, en una interfaz gráfica una persona puede abrir carpetas una por una hasta encontrar un archivo. En una terminal, esa misma tarea puede resolverse escribiendo comandos para listar, buscar o moverse entre directorios.

La terminal no reemplaza todo lo demás, pero es especialmente útil cuando hay muchos archivos, tareas repetitivas o pasos que conviene volver a correr varias veces.



## ¿Qué es Bash?

Bash es un intérprete de comandos, también llamado shell. Es el programa que toma lo que escribimos en la terminal, lo interpreta y se lo comunica al sistema operativo.

En el día a día de un bioinformático, Bash es la herramienta principal para:

- navegar entre carpetas
- inspeccionar archivos
- mover o copiar datos
- combinar comandos
- automatizar tareas repetitivas

**Resumen:**

- `terminal` = la ventana o entorno donde escribís
- `Bash` = el intérprete que entiende esos comandos

## GUI vs CLI

Hay dos formas muy comunes de trabajar con una computadora:

- **GUI**: interfaz gráfica, donde interactuamos con ventanas, botones e íconos
- **CLI**: interfaz de línea de comandos, donde interactuamos escribiendo instrucciones

La GUI suele ser más intuitiva al principio. La CLI suele volverse más poderosa cuando necesitamos repetir tareas, trabajar con muchos archivos o dejar pasos bien documentados.

### Una comparación rápida

| Si trabajás con... | Suele pasar que... |
| --- | --- |
| GUI | hacés clic, abrís ventanas y recorrés carpetas manualmente |
| CLI | escribís instrucciones, repetís pasos y automatizás tareas |


## ¿Por qué Bash importa en bioinformática?

En bioinformática es muy común trabajar con:

- muchos archivos al mismo tiempo
- datos tabulares
- secuencias en archivos de texto
- pipelines con varios pasos
- tareas que conviene automatizar

Ahí Bash se vuelve valioso porque permite hacer operaciones rápidas, reproducibles y fáciles de encadenar. Por ejemplo, puede servir para contar secuencias, buscar un patrón en muchos archivos, reorganizar resultados o ejecutar un mismo paso sobre varias muestras.

Bash importa porque permite trabajar con archivos, comandos y tareas repetitivas de una manera rápida, reproducible y mucho más escalable que hacer todo manualmente.

## ¿Qué vamos a necesitar para este curso?

Para continuar con este curso e ir aplicando lo que aprendés, tenés que contar con acceso a una terminal.

### Si estás en Linux...

**¡Ya tenés todo lo necesario instalado!** Podés abrir una terminal desde el lanzador de aplicaciones o con `Ctrl + Alt + T` o `Win + T`, según la distribución en la que estés.

### Si estás en Windows...

Te recomendamos que instales Ubuntu en Windows Subsystem Linux (WSL): [Ubuntu - Microsoft Store](https://apps.microsoft.com/detail/9pdxgncfsczv)


## Siguiente Paso

Para seguir con el curso, pasá al [Módulo 01: Terminal y rutas](../modulo-01-terminal-y-rutas/README.md).
