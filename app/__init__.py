from flask import Flask, session
from flask_socketio import SocketIO
from flask_bcrypt import Bcrypt
import pymysql.cursors
import os
from dotenv import load_dotenv


load_dotenv()

app = Flask(__name__, template_folder='../templates')
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY')
socketio = SocketIO(app)
bcrypt = Bcrypt(app)

# MySQL Connection
# MySQL Connection
db = pymysql.connect(
    host=os.getenv('DB_HOST'),
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_PASSWORD'),
    database=os.getenv('DB_NAME'),
)
cursor = db.cursor()

# Import routes
from app import routes
