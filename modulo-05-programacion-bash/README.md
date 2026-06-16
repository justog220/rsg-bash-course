# Módulo 05: Programación En Bash

## Teoría

## De comandos sueltos a scripts

En los módulos anteriores ejecutamos comandos de a uno y después los combinamos con redirecciones y *pipes*. Esa forma de trabajo es útil para explorar datos, pero se vuelve incómoda cuando necesitamos repetir los mismos pasos sobre varios archivos muchas veces.

Un **script de Bash** es un archivo de texto que guarda una serie de comandos para ejecutarlos en orden. De esta forma podemos guardar una secuencia lógica de comandos, corregirla y volver a usarlo sin escribir todo otra vez.

Por ejemplo, este script imprime cuatro líneas:

```bash
#!/bin/bash

echo "Esto"
echo "es"
echo "un"
echo "script"
```

La primera línea se llama *shebang* e indica que el archivo debe interpretarse con Bash.

## Variables

Una variable nos permite guardar un valor bajo un nombre para usarlo más de una vez. Puede contener texto, una ruta o el resultado de un comando.

```bash
#!/bin/bash

archivo="datos/control.tsv"
muestra="control"

echo "Archivo: $archivo"
echo "Muestra: $muestra"
```

Al crear una variable no se dejan espacios alrededor de `=` y para leer su contenido se escribe `$` delante del nombre.

### Guardar la salida de un comando

La construcción `$(comando)` ejecuta un comando y permite guardar su salida en una variable.

```bash
#!/bin/bash

archivo="datos/control.tsv"
genes_detectados=$(tail -n +2 "$archivo" | wc -l)

echo "La muestra contiene $genes_detectados genes detectados"
```

La primera línea de la tabla contiene los nombres de las columnas. `tail -n +2` la excluye y `wc -l` cuenta las filas restantes, que corresponden a los genes detectados.

## Condicionales

Un condicional permite ejecutar comandos diferentes según se cumpla o no una condición.

La estructura general de un condicional en Bash es:

```bash
if [[ condición ]]; then
    comandos_si_se_cumple
else
    comandos_si_no_se_cumple
fi
```

Bash evalúa lo que está escrito entre `[[` y `]]`:

- si la condición es verdadera, ejecuta el bloque que está después de `then`;
- si la condición es falsa, salta al bloque que está después de `else`;
- `fi` indica que el condicional terminó.

Es importante dejar espacios dentro de los corchetes dobles. Por ejemplo, `[[ -f "$archivo" ]]` es correcto, mientras que `[[-f "$archivo"]]` no lo es.

Veamos un ejemplo completo:

```bash
#!/bin/bash

archivo="datos/control.tsv"

if [[ -f "$archivo" ]]; then
    echo "El archivo existe"
else
    echo "No se encontró el archivo"
fi
```

La condición de este ejemplo es:

```bash
[[ -f "$archivo" ]]
```

El operador `-f` pregunta si el valor guardado en `archivo` corresponde a un archivo que existe. El signo `$` permite acceder al contenido de la variable y las comillas evitan problemas si la ruta contiene espacios.

Este bloque se puede leer así: **si existe el archivo, mostrar un mensaje; si no existe, mostrar otro**.

### `else` es opcional

No siempre necesitamos indicar qué hacer cuando la condición es falsa. En ese caso podemos omitir `else`:

```bash
#!/bin/bash

if [[ -d "datos" ]]; then
    echo "El directorio de datos está disponible"
fi
```

Si `datos/` existe, se imprime el mensaje. Si no existe, el script continúa después de `fi` sin ejecutar ese `echo`.

### Algunas condiciones frecuentes

Según el operador utilizado, podemos evaluar archivos, texto o números:

| Condición | Pregunta que responde |
| --- | --- |
| `[[ -f "$archivo" ]]` | ¿Existe este archivo? |
| `[[ -d "$directorio" ]]` | ¿Existe este directorio? |
| `[[ "$muestra" == "control" ]]` | ¿Los dos textos son iguales? |
| `[[ "$genes_detectados" -eq 0 ]]` | ¿El número es igual a cero? |
| `[[ "$genes_detectados" -gt 0 ]]` | ¿El número es mayor que cero? |

Por ejemplo, después de contar las filas de una tabla podemos comprobar si contiene genes:

```bash
#!/bin/bash

genes_detectados=$(tail -n +2 "datos/control.tsv" | wc -l)

if [[ "$genes_detectados" -gt 0 ]]; then
    echo "La muestra contiene datos de expresión"
else
    echo "La muestra no contiene genes"
fi
```

Para comparar números se usan operadores como `-eq` (*equal*, igual) y `-gt` (*greater than*, mayor que), no los símbolos que normalmente usamos en matemática.

## Ciclos o bucles

Un bucle repite los mismos comandos para una serie de valores. El bucle `for` es de utilidad cuando queremos procesar varios archivos de la misma forma.

La estructura general de un bucle `for` en Bash es:

```bash
for variable in valor_1 valor_2 valor_3; do
    comandos_que_se_repiten
done
```

Cada parte cumple una función:

- `for` inicia el bucle;
- `variable` es el nombre que usamos para guardar el valor de la repetición actual;
- `in` introduce la lista de valores que queremos recorrer;
- `do` marca el comienzo de los comandos que se repetirán;
- `done` indica dónde termina el bucle.

### Ciclo con contador

Bash también permite escribir un ciclo incremental con una sintaxis parecida a la de C o C++:

```bash
for (( i=1; i<=4; i++ )); do
    echo "Repetición $i"
done
```

Dentro de `(( ))` hay tres expresiones separadas por punto y coma:

- `i=1`: crea el contador `i` y le asigna su valor inicial;
- `i<=4`: indica que el ciclo continúa mientras `i` sea menor o igual que `4`;
- `i++`: aumenta el valor de `i` en uno después de cada repetición.

La salida es:

```text
Repetición 1
Repetición 2
Repetición 3
Repetición 4
```

Esta forma resulta útil cuando sabemos cuántas veces queremos repetir una tarea. En cambio, la forma `for variable in lista` es más directa cuando queremos recorrer nombres, valores o archivos.

### Ciclo sobre una lista

El punto y coma de `; do` separa la lista de valores de la palabra `do`. También se puede escribir `do` en la línea siguiente y omitir el punto y coma:

```bash
for muestra in muestra_1 muestra_2 muestra_3 muestra_4
do
    echo "Procesando $muestra"
done
```

Bash realiza una repetición por cada valor de la lista. En la primera, `$muestra` vale `muestra_1`; en la segunda, `muestra_2`; y así sucesivamente hasta llegar a `muestra_4`.

Este primer ejemplo recorre nombres escritos directamente en el código. Ahora aplicá la misma lógica a archivos reales: en lugar de escribir los cuatro nombres a mano, Bash construirá la lista a partir de las tablas disponibles.

Para probarlo, tenés cuatro tablas dentro de `datos/muestras/`:

- `muestra_1.tsv`;
- `muestra_2.tsv`;
- `muestra_3.tsv`;
- `muestra_4.tsv`.

Cada tabla contiene genes y sus conteos para una muestra diferente.

El siguiente bucle conserva la misma estructura. Lo único que cambia es la lista ubicada después de `in`:

```bash
#!/bin/bash

for archivo in datos/muestras/muestra_*.tsv; do
    echo "Procesando $archivo"
done
```

En este caso no escribimos cada ruta por separado. El patrón `muestra_*.tsv` selecciona los nombres que comienzan con `muestra_` y terminan en `.tsv`. El símbolo `*` representa cualquier conjunto de caracteres.

Antes de comenzar el bucle, Bash busca los archivos coincidentes y obtiene una lista equivalente a:

```text
datos/muestras/muestra_1.tsv
datos/muestras/muestra_2.tsv
datos/muestras/muestra_3.tsv
datos/muestras/muestra_4.tsv
```

Después realiza una repetición por cada ruta:

1. guarda la ruta actual en la variable `archivo`;
2. ejecuta todos los comandos entre `do` y `done`;
3. toma la ruta siguiente y vuelve a empezar;
4. termina cuando ya no quedan elementos en la lista.

Dentro del bloque usamos `$archivo` para acceder al valor de la repetición actual. Conviene escribirlo entre comillas, `"$archivo"`, cuando se usa como argumento de otro comando, porque una ruta podría contener espacios.

Podemos combinar el bucle con variables y comandos vistos anteriormente:

```bash
for archivo in datos/muestras/muestra_*.tsv; do
    genes_detectados=$(tail -n +2 "$archivo" | wc -l)
    echo "$archivo contiene $genes_detectados genes detectados"
done
```

La salida esperada es:

```text
datos/muestras/muestra_1.tsv contiene 3 genes detectados
datos/muestras/muestra_2.tsv contiene 4 genes detectados
datos/muestras/muestra_3.tsv contiene 2 genes detectados
datos/muestras/muestra_4.tsv contiene 5 genes detectados
```

## Siguiente Paso

Con estas herramientas ya podés encadenar navegación, lectura de archivos, filtros y un script breve para resolver un caso completo.

Seguí en la [Actividad integradora: El gen campeón](../modulo-06-actividad-integradora/README.md).
