import os

class Config:
    BASE_DIR = os.path.abspath(os.path.dirname(__file__))
    SQLALCHEMY_DATABASE_URI = 'sqlite:///C:/Users/joose/PycharmProjects/it-mentor/instance/database.db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = 'salajanevõti'
