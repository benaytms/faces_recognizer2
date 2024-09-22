#!/bin/bash

SOURCE_FOLDER="files"

PYTHON_SCRIPT="FACE2.py"

SAVE_FOLDER="recognized_files"

for img in $(ls "$SOURCE_FOLDER"/image_* | sort -V); do
    echo "processing $img..."
    
    python3 "$PYTHON_SCRIPT" "$img" "$SAVE_FOLDER"
done
