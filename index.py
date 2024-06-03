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
    sponsors = [
        {"Pritty": "Sponsor 1", "logo": "https://www.pritty.com.ar/img/imgredes.jpg", "description": "Es una reconocida marca argentina de bebidas, famosa por su línea de gaseosas y aguas saborizadas. Fundada en 1968, Pritty se ha consolidado como un referente en el mercado de bebidas no alcohólicas en Argentina, ofreciendo productos que se destacan por su sabor refrescante y calidad."},
        {"Coca-cola": "Sponsor 2", "logo": "https://ams3.digitaloceanspaces.com/graffica/2023/02/cocacola-logo-1024x696.jpeg", "description": "The Coca-Cola Company es una corporación multinacional estadounidense de bebidas con sede en Atlanta, Georgia. The Coca-Cola Company tiene intereses en la fabricación, venta minorista y comercialización de concentrados y jarabes para bebidas no alcohólicas. "},
        {"name": "Sponsor 3", "logo": "url_to_logo3.png", "description": "Description 3"},
        {"name": "Sponsor 4", "logo": "url_to_logo4.png", "description": "Description 4"},
        {"name": "Sponsor 5", "logo": "url_to_logo5.png", "description": "Description 5"},
        {"name": "Sponsor 6", "logo": "url_to_logo6.png", "description": "Description 6"},
        {"name": "Sponsor 7", "logo": "url_to_logo7.png", "description": "Description 7"},
        {"name": "Sponsor 8", "logo": "url_to_logo8.png", "description": "Description 8"},
        {"name": "Sponsor 9", "logo": "url_to_logo9.png", "description": "Description 9"},
        {"name": "Sponsor 10", "logo": "url_to_logo10.png", "description": "Description 10"},
    ]
    return render_template('sponsors.html', sponsors=sponsors)

@app.route('/equipos')
def equipos():
    return render_template('equipos.html')

if __name__ == '__main__':
    app.run(debug=True)
