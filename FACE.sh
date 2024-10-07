#!/bin/bash

SOURCE_FOLDER="./files"
# THIS IS WHERE YOU SAVE THE IMAGES YOU WANT TO USE
# it can be .jpg, .jpeg, .png and .webp


SAVE_FOLDER="./recognized_files"
# THIS IS WHERE THE FILES WILL BE SAVED AFTER THE ALGORITHM IDENTIFY THE FACES
# i suggest you leave it as it is and if you want you can copy from there


PYTHON_SCRIPT="./scripts/FACE2.py"
# this is the python script with the face recognition algorithm
# i suggest only using the FACE2.py, but if you want to test the other
# it's FACE.py


mkdir -p "$SOURCE_FOLDER"
mkdir -p "$SAVE_FOLDER"
# this will make sure the folders exist


for img in $(ls "$SOURCE_FOLDER"/*.{jpg,jpeg,png,webp} 2>/dev/null | sort -V); do
    # this will go through the source_folder, using the pattern image_*
    # it'll iterate through all the images on a increasing order, so
    # image_1 > image_2 > image_3 > ... > image_n
    
    # also no need to change anything from here
    echo "processing $img..."
    
    python3 "$PYTHON_SCRIPT" "$img" "$SAVE_FOLDER"
    # this is the python command used
done
