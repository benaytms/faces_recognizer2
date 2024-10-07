## second try using now dnn (deep neural networks)
## much better result

import cv2
import sys
import os
from time import sleep

import numpy as np
import matplotlib
matplotlib.use("tkagg")
import matplotlib.pyplot as plt

def plotshow(image, flag, duration=0.65):
    if flag == 'gray':
        plt.imshow(image, cmap='gray')
    else:
        plt.imshow(image)
    
    plt.axis('off')
    plt.show(block=False)
    plt.pause(duration)
    
def save_rec_img(image, output_path):
    cv2.imwrite(output_path, image)

IMG_PATH = sys.argv[1]
OUTPUT_PATH = sys.argv[2]

net = cv2.dnn.readNetFromCaffe('dnnModels/deploy.prototxt', 'dnnModels/res10_300x300_ssd_iter_140000.caffemodel')

img = cv2.imread(IMG_PATH)
h, w = img.shape[:2]

blob = cv2.dnn.blobFromImage(cv2.resize(img, (300, 300)), 1.0, (300, 300), (104.0, 177.0, 123.0))
net.setInput(blob)
detections = net.forward()

img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
plotshow(img_gray, 'gray')

faces_found = False
for i in range(detections.shape[2]):
    confidence = detections[0, 0, i, 2]
    if confidence > 0.5:
        faces_found = True
        box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
        (startX, startY, endX, endY) = box.astype("int")
        cv2.rectangle(img, (startX, startY), (endX, endY), (127, 0, 255), 2)

if faces_found:
    output_path = os.path.join(OUTPUT_PATH, os.path.basename(IMG_PATH))
    save_rec_img(img, output_path)
    print(f"image saved at: {output_path}")
else:
    print("no faces found")
    sleep(0.65)
    
img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
plotshow(img_rgb, 'not_gray', duration=1.2)
