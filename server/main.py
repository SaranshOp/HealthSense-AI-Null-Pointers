# import os
# os.environ['KMP_DUPLICATE_LIB_OK']='TRUE'
# os.environ['MKL_THREADING_LAYER']='GNU'
# os.environ['MKL_SERVICE_FORCE_INTEL']='1'
from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
from transformers import pipeline
# import torch 
# import torch.nn as nn
# from torchvision import models, transforms
# from PIL import Image
# import random
# import numpy as np
# from transformers import pipeline
pipe = pipeline("image-classification", model="dewifaj/alzheimer_mri_classification")

llm_pipeline = pipeline("text-generation", model="microsoft/biogpt")     
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

@app.route("/upload-photo-MRI", methods=["POST"])
def receivePhotoMRI():
    file = request.files['image']
    if file:
        filename = secure_filename(file.filename)
        filename += ".jpg"
        file.save("./uploads/MRI/" + filename)
        return jsonify({'message': 'Image uploaded successfully',
                        'status': "success"}), 200
    else:
        return jsonify({'error': 'File type not allowed'}), 400

@app.route("/process-image-MRI", methods=["GET"])
def processImageMRI():
    print("starting process image MRI")
    result = pipe("C:/Users/sarth/Development/null_pointers/server/uploads/MRI/image.jpg")
    return jsonify({"result": result})

@app.route("/get-advice", methods=["GET"])
def get_advice():
    """
    Generate medical advice based on patient info and analysis results.
    """
    try:
        # data = request.json
        # Extract and format patient details from request
         # # Extract data from request
        # name = data.get('name')
        # age = data.get('age')
        # gender = data.get('gender')
        # symptoms = data.get('symptoms')
        # mri_results = data.get('mri_results')
        # xray_results = data.get('xray_results')

        name = "krish"
        age = 30
        gender = "male"
        symptoms = "chest pain, shortness of breath"
        mri_results ="mild demented"
        xray_results = "90% pneumonia"
        # Construct prompt
        findings = f"X-ray: {xray_results}; MRI: {mri_results}"
        categories = ["Precautions", "food", "exercise"]
        # Dictionary to store results
        advice_results = {}
        
        # Generate advice for each category
        for category in categories:
            prompt = f"Given a {age}-year-old {gender} patient with symptoms: {symptoms} and findings: {mri_results}, {xray_results}, show me "
            
            if category == "Precautions":
                prompt += ".5 precautionary advices that patient has to follow in this condition are"
            elif category == "food":
                prompt += ".5 foods that might support speedy recovery are"
            elif category == "exercise":
                prompt += ".5 suitable exercises or daily routine plans that patient has to follow in this condition are"
            
            result = llm_pipeline(prompt,
                                max_length=200,
                                do_sample=True,
                                num_return_sequences=1)

            generated_text = result[0]['generated_text'].replace(prompt, "").strip()
            advice_results[category] = generated_text

            print(advice_results)
        return jsonify({"status": "success", "advice": advice_results}), 200

    except Exception as e:
        print("error_aa_gyi")
        return jsonify({"status": "error", "message": str(e)}), 500
