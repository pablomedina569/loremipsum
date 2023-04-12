# Repositorio "loremipsum"

En este repositorio se genero lo siguente:

## Pasos realizados

1. Se crea un nuevo repositorio público en GitHub llamado "loremipsum".
2. Se clona el repositorio en el entorno local usando el siguiente comando en la terminal:

>git clone git@github.com:pablomedina569/loremipsum.git

3. Se crea una nueva rama en tu repositorio local, llamada "generarlipsum"

>git checkout -b generarlipsum

4. Se agrega  a tu repositorio el archivo lipsum.sh que se provee adjunto a esta tarea.

```bash
#!/bin/bash

for i in {1..5}
do
    #obtiene una cantidad aleatoria de número de lineas entre 1 y 20
    lineas=$(shuf -i 1-20 -n 1)
    #llama con curl a lipsum.com y le pasa como parámetro la cantidad de líneas
    lorem=$(curl -s https://www.lipsum.com/feed/xml\?amount\=$lineas | sed -n '/<lipsum>/,/<\/lipsum>/p' | sed -e 's/<lipsum>//g' -e 's/<\/lipsum>//g'
)   
    #crea un archivo con el contenido de la variable lorem
    echo "$lorem" >> loremipsum-$i.txt
done
```

5. Se genera los 5 archivos txt basándose en el sitio lipsum.com, ejecutando:

>bash ./lipsum.sh

6. Se verifica que se crearon los cinco archivos y que tengan contenido.

7. Se agregan los archivos modificados
   
>git add .

8. Se crea un commit con los archivos generados y el lipsum.sh

>git commit -m "Agrego lipsum + 5 loremipsum"

9. luego se realiza un push al repositorio en github.

>git push -u origin main

10. Se codifica un nuevo archivo, "contar.sh", que lee cada uno de los txt generados y luego devuelve por cada archivo, la cantidad de líneas de ese archivo.
Al ejecutar el archivo, se muestran la cantidad de líneas que tiene cada uno realizando el siguiente codigo:

```bash
#!/bin/bash

# Función para contar líneas en un archivo
contar_lineas() {
  archivo="$1"
  lineas=$(wc -l "$archivo" | awk '{print $1}')
  echo "$archivo tiene $lineas líneas."
}

# Contar líneas en los archivos generados
for archivo in loremipsum-*.txt; do
  contar_lineas "$archivo"
done
```
y ejecutando:

>bash ./contar.sh

11. Se agrega y se crea un nuevo commit en la rama "generarlipsum" sumando el nuevo archivo "contar.sh"

>git commit -m "Se agrega contar lineas de los archivos txt"

12. Se realiza push de lo que se modifico
13. Se realiza detalles del README.md
14. Realiza un merge de tu rama "generarlipsum" a la rama principal de tu repositorio usando una Pull Request.
