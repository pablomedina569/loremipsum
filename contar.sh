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
