from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
from transformers import pipeline
import os
import torch 
import torch.nn as nn
from torchvision import models, transforms
from PIL import Image
import random
import numpy as np


classifier = pipeline(model="lxyuan/vit-xray-pneumonia-classification")

print("Backend running")
UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER



@app.route("/hello")
def sayHi():
    return "<p>Hello, World!</p>"


@app.route("/upload-photo", methods=["POST"])
def receivePhoto():
    file = request.files['image']
    if file:
        print("upload intp")
        filename = secure_filename(file.filename)
        filename += ".jpg"
        file.save("./uploads/" + filename)
        return jsonify({'message': 'Image uploaded successfully',
                        'status': "success"}), 200
    else:
        return jsonify({'error': 'File type not allowed'}), 400

@app.route("/process-image", methods=["GET"])
def processImage():
    print("starting process image")
    result = classifier("C:/Users/sarth/Development/null_pointers/server/uploads/image.jpg")
    return jsonify({"result": result})



