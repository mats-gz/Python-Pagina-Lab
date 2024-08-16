from flask import Flask, render_template
import mysql.connector
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)

CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:cocoymati88@localhost:3306/CopaReno'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Equipos(db.Model):
    __tablename__ = "Equipos"
    id_equipo = db.Column(db.Integer, primary_key = True)
    nombre = db.Column(db.String(100), nullable=False)
    id_colegio = db.Column(db.Integer, db.ForeignKey('colegios.id_colegio'), nullable=False)
    entrenador = db.Column(db.String(100))
    categoria = db.Column(db.String(20), nullable=False)  # FUTBOL, VOLEY O BASQUET
    puntos_totales = db.Column(db.Integer)
    clasificación_final = db.Column(db.String(50))  # Posición Nº(X)

class Cantina(db.Model):
    __tablename__ = "Cantina"
    id_plato = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    descripcion = db.Column(db.Text, nullable=True)
    precio = db.Column(db.Numeric(10, 2), nullable=False)
    disponibilidad = db.Column(db.Boolean, nullable=False, default=True)
    imagen = db.Column(db.String(255), nullable=True)


@app.route('/')
def home():
    return render_template('home.html')

@app.route('/cantina')
def cantina():
    # Query all available items from the Cantina table
    items = Cantina.query.filter_by(disponibilidad=True).all()

    # Pass the items to the cantina.html template
    return render_template('cantina.html', items=items)


@app.route('/contacto')
def contacto():
    return render_template('contacto.html')

@app.route('/sponsors')
def sponsors():
    sponsors = []

    return render_template('sponsors.html', sponsors=sponsors)

@app.route('/deportes')
def deportes():
    return render_template('deportes.html')

@app.route('/voley', methods=['GET'])
def voley():
    tablas_equipos = Equipos.query.filter_by(categoria='voley').all()

    equipos = [] 
    for equipo in tablas_equipos:
        equipos.append({"id":equipo.id_equipo, "nombre":equipo.nombre, "entrenador":equipo.entrenador, "puntos totales":equipo.puntos_totales, "clasificación final":equipo.clasificación_final})

    return render_template('voley.html', equipos=equipos)

@app.route('/futbol', methods=['GET'])
def futbol():
    # Obtener todos los equipos de fútbol desde la base de datos
    equipos = Equipos.query.filter_by(categoria='futbol').all()

    # Agrupar los equipos en listas de 4
    grupos = [equipos[i:i + 4] for i in range(0, len(equipos), 4)]

    return render_template('futbol.html', grupos=grupos)

@app.route('/basquet', methods=['GET'])
def basquet():
    # Obtener todos los equipos de básquet desde la base de datos
    equipos = Equipos.query.filter_by(categoria='basquet').all()

    # Agrupar los equipos en listas de 4
    grupos = [equipos[i:i + 4] for i in range(0, len(equipos), 4)]

    return render_template('basquet.html', grupos=grupos)


if __name__ == '__main__':
    app.run(debug=True)


