from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/calendario')
def calendario():
    return render_template('calendario.html')

@app.route('/contacto')
def contacto():
    return render_template('contacto.html')

@app.route('/sponsors')
def sponsors():
    return render_template('sponsors.html')

@app.route('/equipos')
def equipos():
    return render_template('equipos.html')

if __name__ == '__main__':
    app.run(debug=True)

