from flask import Flask
from .config import Config
from .extensions import db, ma
from .api import api_bp
from .views import views_bp

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Initialiseerime laiendused
    db.init_app(app)
    ma.init_app(app)

    # Registreerime Blueprintid
    app.register_blueprint(api_bp, url_prefix='/api')
    app.register_blueprint(views_bp)

    return app
