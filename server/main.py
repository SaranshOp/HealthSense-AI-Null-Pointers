from flask import Flask
print("test")
app = Flask(__name__)

@app.route("/hello")
def sayHi():
    return "<p>Hello, World!</p>"

