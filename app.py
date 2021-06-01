from flask import Flask,render_template,send_from_directory
from whitenoise import WhiteNoise

app = Flask(__name__)
app.wsgi_app = WhiteNoise(app.wsgi_app, root='static/dist')

@app.route("/")
def index():
    return send_from_directory("static/dist/","index.html")