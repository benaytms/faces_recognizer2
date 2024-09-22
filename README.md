# Face Recognizer Program  

# Similar to the other face_recognizer but with improvements  

The first program (which is included in this too, FACE.py) uses Haar Cascade Classifier  
which doesn't work great when faces aren't frontal and very clear to see.  

This second one in compensation works much better, it uses Single Shot MultiBox Detector (SSD)
which is a classifier that uses a single neural network.  
It's able to find faces in much harder instances and situations; Even though it's not perfect - comes closer than the former.

## If you want to test it  
You'll need these packages:  
* OpenCV: pip install opencv-python  
* NumPy: pip install numpy
* MatplotLib: pip install matplotlib

or just: pip install opencv-python numpy matplotlib

## To run
* git clone https://github.com/benaytms/faces_recognizer2.git
* cd faces_recognizer2
* mkdir files recognized_files  
* (check the FACE shell file comments to understand how and where to save the images in order to work)
* bash FACE.sh

As i said earlier, it's not perfect, so don't worry if some faces don't get recognize.  
Should work fine in most cases though.

## Acknowledgments

This project uses the Single Shot MultiBox Detector (SSD) algorithm for face detection. The SSD algorithm is described in the following paper:

- Liu, W., Anguelov, D., Erhan, D., Szegedy, C., & Tyagi, A. (2016). SSD: Single Shot MultiBox Detector. In European Conference on Computer Vision (ECCV).

For more details, refer to the [original paper](https://arxiv.org/abs/1512.02325) and the [Caffe model repository](https://github.com/weiliu89/caffe/tree/ssd).
