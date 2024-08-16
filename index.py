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



grupo_1 = [
    {"Nombre Equipo": "Monserrat", "puntos": 8, "partidos jugados": 3, "partidos perdidos": 1, "partidos ganados": 2},
    {"Nombre Equipo": "Manuel Belgrano", "puntos": 5, "partidos jugados": 3, "partidos perdidos": 2, "partidos ganados": 1},
    {"Nombre Equipo": "Instituto Técnico Renault", "puntos": 7, "partidos jugados": 3, "partidos perdidos": 1, "partidos ganados": 2},
    {"Nombre Equipo": "Dr. Alejandro Carbó", "puntos": 9, "partidos jugados": 3, "partidos perdidos": 0, "partidos ganados": 3}
]

grupo_2 = [
    {"Nombre Equipo": "San José", "puntos": 6, "partidos jugados": 3, "partidos perdidos": 2, "partidos ganados": 1},
    {"Nombre Equipo": "Instituto Secundario Mariano Moreno", "puntos": 4, "partidos jugados": 3, "partidos perdidos": 3, "partidos ganados": 0},
    {"Nombre Equipo": "Santa Infancia", "puntos": 7, "partidos jugados": 3, "partidos perdidos": 1, "partidos ganados": 2},
    {"Nombre Equipo": "Taborin", "puntos": 5, "partidos jugados": 3, "partidos perdidos": 2, "partidos ganados": 1}
]

grupo_3 = [
    {"Nombre Equipo": "Villada", "puntos": 6, "partidos jugados": 3, "partidos perdidos": 2, "partidos ganados": 1},
    {"Nombre Equipo": "San Pablo", "puntos": 8, "partidos jugados": 3, "partidos perdidos": 1, "partidos ganados": 2},
    {"Nombre Equipo": "Sagrado Corazón", "puntos": 9, "partidos jugados": 3, "partidos perdidos": 0, "partidos ganados": 3},
    {"Nombre Equipo": "Colegio Cristo Rey", "puntos": 5, "partidos jugados": 3, "partidos perdidos": 2, "partidos ganados": 1}
]

grupo_4 = [
    {"Nombre Equipo": "San Pedro", "puntos": 7, "partidos jugados": 3, "partidos perdidos": 1, "partidos ganados": 2},
    {"Nombre Equipo": "La Salle", "puntos": 4, "partidos jugados": 3, "partidos perdidos": 3, "partidos ganados": 0},
    {"Nombre Equipo": "Instituto Juan Zorrilla de San Martín", "puntos": 6, "partidos jugados": 3, "partidos perdidos": 2, "partidos ganados": 1},
    {"Nombre Equipo": "Pías", "puntos": 8, "partidos jugados": 3, "partidos perdidos": 1, "partidos ganados": 2}
]

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/cantina')
def cantina():
    return render_template('cantina.html')

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


