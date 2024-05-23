#!/bin/bash

# Pasta de origem dos arquivos .mkv
SOURCE_DIR="_aulas/"

# Pasta de destino dos arquivos .mp4
DEST_DIR="_aulas/"

# Loop pelos arquivos .mkv na pasta de origem
for mkv_file in ${SOURCE_DIR}/*.mkv; do
    # Nome do arquivo sem extensão
    base_name=$(basename "$mkv_file" .mkv)
    
    # Caminho do arquivo de saída .mp4
    mp4_file="${DEST_DIR}/${base_name}.mp4"
    
    # Converter .mkv para .mp4
    ffmpeg -i "$mkv_file" -c:v libx264 -preset slow -crf 22 -c:a aac -strict experimental "$mp4_file"
done
