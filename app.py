from flask import Flask,render_template,send_from_directory
from whitenoise import WhiteNoise

app = Flask(__name__,static_folder="static/dist",static_url_path="/static/dist") 
app.wsgi_app = WhiteNoise(app.wsgi_app, root='static/dist')



@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    return app.send_static_file("index.html")
