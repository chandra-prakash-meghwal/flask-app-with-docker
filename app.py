import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

# Configure the database connection using environment variables
sqlalchemy_database_uri = f"mysql://{os.environ['DB_USER']}:{os.environ['DB_PASSWORD']}@{os.environ['DB_HOST']}/{os.environ['DB_NAME']}"
print(f'sqlalchemy_database_uri {sqlalchemy_database_uri}')
app.config['SQLALCHEMY_DATABASE_URI'] = sqlalchemy_database_uri
db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True)

@app.route('/')
def hello():
    return "Hello, Flask in Docker!"

if __name__ == '__main__':
    db.create_all()
    app.run(host='0.0.0.0', port=5000)
