from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import os
print("Backend running")
UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route("/hello")
def sayHi():
    return "<p>Hello, World!</p>"

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route("/upload-photo", methods=["POST"])
def receivePhoto():
    print("received images hopefully")
    # return "received images hopefully"
    # if 'image' not in request.files:
    #     return jsonify({'error': 'No image part'}), 400
    file = request.files['image']
    print(file)
    if file:
        filename = secure_filename(file.filename)
        filename += ".png"
        file.save("./uploads/" + filename)
        return jsonify({'message': 'Image uploaded successfully'}), 200
    else:
        return jsonify({'error': 'File type not allowed'}), 400
    return "received images hopefully"
    # if file.filename == '':
    #     return jsonify({'error': 'No selected file'}), 400
    # if file and allowed_file(file.filename):
    #     filename = secure_filename(file.filename)
    #     file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
    #     return jsonify({'message': 'Image uploaded successfully'}), 200
    # else:
    #     return jsonify({'error': 'File type not allowed'}), 400



