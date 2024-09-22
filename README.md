## Face Recognizer Program  

# Similar to the other face_recognizer but with improvements  

The first program (which is included in this too, FACE.py) uses Haar Cascade Classifier  
which doesn't work great when faces aren't frontal and very clear to see.  

This second one in compensation works much better, it uses Single Shot MultiBox Detector (SSD)
which is a classifier that uses DNN (Deep Neural Networks).  
It's able to find faces in much more hard to identify situations, even though it's not perfect - comes closer than the former.

# If you want to test it  
You'll need these packages:  
OpenCV: pip install opencv-python  
NumPy: pip install numpy
MatplotLib: pip install matplotlib

or just: pip install opencv-python numpy matplotlib

# To run
