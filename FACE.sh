#!/bin/bash

SOURCE_FOLDER="files"
# this is where the images you want to identify faces go

# you'll need to save them with the following standard: image_{number}
# for instance if you want to use 3 images you'll save them as such:
# image_1.jpg, image_2.jpg, image_3.jpg 
# (as far as i know the extension can be any valid image format, jpg, png, webp, etc)

PYTHON_SCRIPT="FACE2.py"
# this is the python script with the face recognition algorithm

# you don't need to change this

SAVE_FOLDER="recognized_files"
# this is where the files will be saved after you use the script

# i suggest you leave it as it is and if you want you can copy from there

for img in $(ls "$SOURCE_FOLDER"/image_* | sort -V); do
    # this will go through the source_folder, using the pattern image_*
    # it'll iterate through all the images on a increasing order, so
    # image_1 > image_2 > image_3 > ... > image_n
    
    # also no need to change anything from here
    echo "processing $img..."
    
    python3 "$PYTHON_SCRIPT" "$img" "$SAVE_FOLDER"
    # this is the python command used
done
