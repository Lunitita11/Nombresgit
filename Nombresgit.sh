#!/bin/bash

echo -e "\e[35m
╔═╦╦═╦╗╔═╦═╦═╦╗
║╣╣║║║║║╔╣╦╣║║║
╚═╩╩╩═╝╚═╩═╩╩═╝\e[0m"

echo -e "\e[31mGENERADOR DE NOMBRESKUKITITA\e[0m"
# Función para generar un combo
generate_combo() {
    local email="$1"
    local password="$2"
    echo "$email:$password"
}

# Función para generar un número aleatorio de 6 dígitos
generate_random_number() {
    echo $((100000 + RANDOM % 900000))
}

# Función principal
main() {
    echo "Ingresa el número de combos a generar:"
    read num_combos

    # Crear el directorio de salida en la tarjeta SD
    output_dir="/sdcard/combos"
    mkdir -p "$output_dir"

    # Generar y guardar los combos
    for i in $(seq 1 $num_combos); do
        random_number=$(generate_random_number)
        email="example$random_number@gmail.com"
        password="Password$random_number"
        combo=$(generate_combo "$email" "$password")
        echo "$combo" >> "$output_dir/combos.txt"
    done

    echo "Los combos se han guardado en $output_dir/combos.txt"
}

main