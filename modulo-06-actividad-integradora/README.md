# Módulo 06: Actividad integradora

## El gen campeón

En este cierre vas a resolver un caso corto de principio a fin usando comandos de todo el curso.

La historia es simple: un laboratorio armó una mini base de datos local con genes candidatos para un proyecto interno. Entre esos registros hay un gen especial, pero no aparece marcado de forma directa. Tu trabajo consiste en reconstruir el caso usando cuatro archivos con funciones distintas: un catálogo de candidatos, un estado de indexación, una validación experimental y un archivo con criterios de descarte.

Si llegás al identificador correcto, la consulta va a devolver un único hit.

## Objetivo

Encontrar el identificador del **gen campeón** y usarlo para ejecutar:

```sh
./buscar_gen.sh IDENTIFICADOR
```

La salida esperada al final del caso es:

```text
1 Hit: ...
```

## Archivos del caso

Dentro de `datos/` vas a encontrar:

- `catalogo/catalogo_genes.tsv`: el catálogo principal de genes candidatos;
- `indices/estado_indexacion.tsv`: el estado de indexación de cada gen dentro de la base local;
- `validacion/validacion_musculo.tsv`: una tabla de validación experimental con tejido, réplicas y respuesta;
- `criterios/criterios_descarte.txt`: el archivo con las reglas biológicas del caso.

## Etapa 1: entrar al caso

Ubicate en este módulo y revisá su contenido.

Qué deberías notar:

- el módulo tiene una carpeta `datos/`;
- hay varias fuentes de información con roles distintos;
- el gen campeón no aparece resuelto a simple vista.

## Etapa 2: preparar un espacio de trabajo

Creá una carpeta para reunir las pistas del caso dentro de `resultados/`.

Pista:

- integrá el caso en un directorio recién creado dentro de `resultados/`;
- llevate una copia del catálogo, del estado de indexación, de la validación experimental y de los criterios de descarte a ese espacio de trabajo;
- verificá al final que todo haya quedado reunido en un solo lugar.

Qué buscás en esta etapa:

- tener todas las pistas importantes en un solo lugar;
- practicar copia y organización de archivos antes de analizarlos.

## Etapa 3: leer las pistas y reconocer las columnas clave

Pista:

- `criterios_descarte.txt` empieza con lo importante, pero después sigue con mucho relleno; si lo imprimís completo de una vez, es fácil perder de vista los criterios;
- si sentís que el archivo te desborda en pantalla, pensá en comandos como `more`, `less` o `tail`;
- después inspeccioná el comienzo de las tres tablas;
- extraé solo algunas columnas para reconocer qué campos van a importar más adelante.

Qué deberías identificar:

- en `catalogo_genes.tsv` importan `gene_id`, `chrom`, `status`, `score` y `function`;
- en `estado_indexacion.tsv` importa el estado de indexación de cada gen;
- en `validacion_musculo.tsv` importan `tissue`, `replicas_validas` y `response`;
- en `criterios_descarte.txt` la parte útil está al principio, antes del relleno;
- las pistas obligan a cruzar condiciones, no alcanza con mirar una sola columna.

## Etapa 4: filtrar candidatos hasta llegar a un único gen

Ahora sí, empezá a descartar.

Pistas:

- empezá descartando genes por cromosoma;
- después quedate solo con los registros activos;
- aplicá el umbral de `score` que aparece en `criterios_descarte.txt`;
- usá la función biológica para reducir todavía más los candidatos;
- cruzá los candidatos con `estado_indexacion.tsv` y comprobá cuáles siguen `indexado`;
- usá `validacion_musculo.tsv` para filtrar por tejido, cantidad de réplicas y tipo de respuesta;
- si terminás con listas de `gene_id` en archivos separados, recordá que `grep -f` puede servir para buscar la intersección entre candidatos;
- recién al final guardá el identificador que sobrevivió a todos los cruces.

Si te resulta cómodo, guardá el identificador final en un archivo dentro de `resultados/` para reutilizarlo después.

## Etapa 5: consultar la base local

El script `buscar_gen.sh` simula una búsqueda local en base de datos. No hace una búsqueda real sobre internet ni sobre una base externa: valida el identificador y, si coincide con el registro esperado, decodifica una respuesta oculta desde `.solution`.

Pista:

- corré el script pasándole como argumento el identificador que obtuviste en la etapa anterior;
- si guardaste ese valor en un archivo, reutilizalo desde ahí en lugar de volver a escribirlo.

Si consultás con el identificador correcto, vas a obtener un único hit.

## Desafío extra

Sin modificar el script, probá qué pasa si:

- consultás con un identificador incorrecto;
- ejecutás el script sin argumentos.

Observá cómo cambia la salida según la entrada.

## Siguiente Paso

Este módulo cierra el recorrido principal del curso. Si querés, podés volver a cualquiera de los módulos anteriores y repetir el caso intentando resolverlo con menos comandos intermedios.
