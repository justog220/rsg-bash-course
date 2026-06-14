# Comandos básicos de Bash

A continuación hay una lista de los comandos más usados en Bash. En el curso vas a ir viendo los más importantes en contexto.

| Comando | Qué hace | Ejemplo |
|---------|----------|---------|
| `pwd`   | Muestra la ruta del directorio actual | `pwd` → `/home/usuario/proyecto` |
| `ls`    | Lista los archivos y carpetas del directorio | `ls` → `archivo1.txt archivo2.txt` |
| `cd`    | Cambia de directorio | `cd datos/` → cambia al subdirectorio `datos` |
| `mkdir` | Crea un nuevo directorio | `mkdir resultados` → crea carpeta `resultados` |
| `rmdir` | Elimina directorios vacíos | `rmdir carpeta_vacia` → borra la carpeta |
| `rm`    | Elimina archivos | `rm archivo.txt` → borra `archivo.txt` |
| `cp`    | Copia archivos | `cp archivo.txt backup/` → copia archivo a `backup/` |
| `mv`    | Mueve o renombra archivos | `mv archivo.txt archivo_old.txt` → renombra archivo |
| `head`  | Muestra las primeras líneas de un archivo | `head sample.fastq` → primeras 10 líneas |
| `tail`  | Muestra las últimas líneas de un archivo | `tail sample.fastq` → últimas 10 líneas |
| `wc`    | Cuenta líneas, palabras o caracteres | `wc -l sample.fastq` → número de líneas |
| `cat`   | Muestra el contenido de un archivo | `cat archivo.txt` → imprime el archivo en pantalla |
| `less`  | Permite ver un archivo página por página | `less archivo.txt` → navegación interactiva |
| `grep`  | Busca texto dentro de un archivo | `grep "ATG" sample.fasta` → muestra líneas con "ATG" |
| `chmod` | Cambia permisos de archivo o carpeta | `chmod 755 script.sh` → permisos de ejecución |
| `echo`  | Imprime texto en la terminal. | `echo "Hola mundo"` → imprime "Hola mundo" en la terminal |
| `wget`  | Descarga archivos desde una URL | `wget https://example.org/file.fasta` → descarga el archivo |
| `awk`   | Procesa texto y columnas de archivos | `awk '{print $1}' archivo.tsv` → imprime la primera columna |
| `gunzip` | Descomprime archivos `.gz` | `gunzip archivo.fasta.gz` → descomprime el archivo |
| `zcat`  | Muestra el contenido de un archivo `.gz` sin descomprimir | `zcat archivo.fasta.gz` → imprime el archivo en pantalla |
| `./`    | Ejecuta un script o programa en el directorio actual | `./script.sh` → ejecuta `script.sh` |
| `|`     | Pipe: envía la salida de un comando como entrada de otro | `cat archivo.txt | grep "gene"` → filtra líneas con "gene" |
| `*`     | Comodín que representa cualquier cadena de caracteres | `ls *.fastq` → lista todos los archivos que terminan en `.fastq` |


## Errores más comunes en Bash

| Tipo de error | Mensaje típico | Descripción |
|--------------|---------------|-------------|
| Comando no encontrado | `command not found` | El comando está mal escrito o no está instalado en el sistema. |
| Archivo o directorio inexistente | `No such file or directory` | La ruta es incorrecta, el archivo no existe o no estás en el directorio adecuado. |
| Permiso denegado | `Permission denied` | Se intenta acceder o ejecutar un recurso sin permisos suficientes. |
| Error de sintaxis | `syntax error` | Uso incorrecto de paréntesis, comillas, corchetes u otros símbolos. |
| Opción inválida | `invalid option` | Se usó una bandera que el comando no reconoce. |
| Argumentos faltantes | — | El comando requiere argumentos adicionales para poder ejecutarse correctamente. |
| Archivo en uso por otro proceso | — | El archivo está siendo utilizado por otro programa y no puede modificarse. |
| Variables o rutas mal expandidas | — | Errores en el uso de variables (`$var`), `~` o comillas. |
| Sobrescritura accidental o salida vacía | — | El comando se ejecuta sin error, pero produce un resultado incorrecto o vacío. |
| Espacios en nombres de archivos | — | Rutas con espacios requieren comillas o escape con `\`. |
| Entorno mal configurado | — | Problemas con `PATH`, entornos virtuales o módulos no cargados. |
| Redirecciones o pipes incorrectos | — | Uso incorrecto de `|`, `>`, `<` o combinaciones inválidas. |
| Bucles infinitos en scripts | — | Errores lógicos que impiden que el script termine. |
| Caracteres especiales o codificación | — | Caracteres no visibles, tildes o emojis pueden romper comandos. |
