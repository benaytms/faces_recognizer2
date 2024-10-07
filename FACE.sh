#!/bin/bash

SOURCE_FOLDER="./files"
# THIS IS WHERE YOU SAVE THE IMAGES YOU WANT TO TEST

# you'll need to save them with the following standard: image_{number}
# for instance if you want to use 3 images you'll save them as such:
# image_1.jpg, image_2.jpg, image_3.jpg 
# (as far as i know the extension can be any valid image format, jpg, png, webp, etc)

SAVE_FOLDER="./recognized_files"
# THIS IS WHERE THE FILES WILL BE SAVED AFTER THE ALGORITHM IDENTIFY THE FACES
# i suggest you leave it as it is and if you want you can copy from there

PYTHON_SCRIPT="./scripts/FACE2.py"
# this is the python script with the face recognition algorithm
# you don't need to change this (unless you want to use the previous version, FACE1.py, which i don't recommend)

mkdir -p "$SOURCE_FOLDER"
mkdir -p "$SAVE_FOLDER"
# this will make sure the folders exist

for img in $(ls "$SOURCE_FOLDER"/image_* | sort -V); do
    # this will go through the source_folder, using the pattern image_*
    # it'll iterate through all the images on a increasing order, so
    # image_1 > image_2 > image_3 > ... > image_n
    
    # also no need to change anything from here
    echo "processing $img..."
    
    python3 "$PYTHON_SCRIPT" "$img" "$SAVE_FOLDER"
    # this is the python command used
done
