from app.extensions import db
from app import create_app

app = create_app()
with app.app_context():
    db.create_all()
    print("Tabelid on loodud!")