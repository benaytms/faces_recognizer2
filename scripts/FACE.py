##  first try using CascadeClassifier with haarcascades
## didn't work great

import cv2
import sys
from time import sleep

import matplotlib
matplotlib.use("tkagg")
import matplotlib.pyplot as plt

def plotshow(image, flag):
    if flag == 'gray':
        plt.imshow(image, cmap='gray')
    else:
        plt.imshow(image)
    
    plt.axis('off')
    plt.show(block=False)
    plt.pause(0.5)

IMG_PATH = sys.argv[1]
img = cv2.imread(IMG_PATH)

face_classifier = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
plotshow(img_gray, 'gray')

faces = face_classifier.detectMultiScale(img_gray, scaleFactor=1.05, minNeighbors=3)

if len(faces) == ():
    print("no faces found")
    sleep(2)

for (x, y, w, h) in faces:
    cv2.rectangle(img, (x,y), (x+w, y+h), (127, 0, 255), 2)
    
img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
plotshow(img_rgb, 'not_gray')




















