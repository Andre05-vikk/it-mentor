# it-mentor
## Description

 This project is designed to help users evolve as developers
 by allowing them to ask questions.

 The main goal is to provide a platform where users
 can pose questions related to coding or development practices
 and receive answers or guidance.

 ## Getting Started

Follow these instructions to set up and run the application locally.

## Prerequisites

Make sure you have the following installed:

Python 3.8 or higher
MySQL server
Git
 
 ## Installation

Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/your-repo-name.git
cd your-repo-name
Create and activate a virtual environment:

bash
Copy code
python -m venv venv
source venv/bin/activate  # On macOS/Linux
venv\Scripts\activate     # On Windows
Install the required packages:

bash
Copy code
pip install -r requirements.txt

## Database Setup

Start the MySQL server if it’s not already running.

Create the database for the application. Open MySQL from the command line:

bash
Copy code
mysql -u root -p
Inside the MySQL shell, create a new database:

sql
Copy code
CREATE DATABASE your_database_name;
Load the database schema and data from the dump.sql file (if provided):

bash
Copy code
mysql -u root -p your_database_name < dump.sql
Configure database settings:

Update the database URI in config.py with your database credentials, for example:

python
Copy code
SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:your_password@localhost/your_database_name'
Running the Application
Initialize the database tables (if needed):

If there’s no dump.sql or if you need to create tables directly, run:

bash
Copy code
python create_tables.py
Run the application:

bash
Copy code
flask run
The application should now be running at http://127.0.0.1:5000.

## Additional Notes

Environment Variables: Consider using a .env file to store sensitive
information like database credentials, and use python-dotenv to load 
them automatically.

Debugging: For development, you can set FLASK_ENV=development in your environment to enable debugging features.
