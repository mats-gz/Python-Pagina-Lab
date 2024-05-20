from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def principal():
    return render_template("casa.html")

@app.route("/contactos")
def contactos():
    return render_template("contactos.html")

@app.route("/productos")
def productos():
    return render_template("productos.html")

if __name__ == "__main__":
    app.run(debug = True, port = 3000)