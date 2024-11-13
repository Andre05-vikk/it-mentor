# IT Mentorship Platform

This project is a web application designed for IT mentorship, where users can ask questions, get answers, and engage with mentors. The application is built using Flask as the backend framework and MariaDB as the database.

## Table of Contents
- [Features](#features)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [License](#license)

## Features
- User registration and login
- Users can post questions and receive answers
- Database setup that supports scalability and normalization
- Follows good database practices such as `AUTO_INCREMENT` primary keys, foreign key references, and normalized schema

## Getting Started
These instructions will help you set up and run the project on your local machine.

### Prerequisites
- Python 3.x
- MariaDB or MySQL installed locally
- Git for version control

### Installation
1. **Set up a virtual environment** (optional but recommended):
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```

2. **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

### Configuration
Update `config.py` with your database configuration. Here is an example configuration:
    ```python
    class Config:
        SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:password@localhost/it_mentorship'
        SQLALCHEMY_TRACK_MODIFICATIONS = False
        SECRET_KEY = 'your_secret_key'
    ```
Replace `root` and `password` with your MariaDB/MySQL username and password.

### Database Setup
1. **Create the database**:
   Open the MariaDB/MySQL CLI and create a new database:
    ```sql
    CREATE DATABASE it_mentorship;
    USE it_mentorship;
    ```

2. **Import database schema**:
   If you have a `dump.sql` file for the database schema, load it as follows:
    ```bash
    mysql -u root -p it_mentorship < app/dump.sql
    ```
   Enter your MariaDB/MySQL password when prompted.

### Running the Application
To start the application:
    ```bash
    flask run
    ```
By default, the application will run on http://127.0.0.1:5000.

## Project Structure
```graphql
it-mentorship/
├── app/
│   ├── __init__.py             # Initializes the Flask application
│   ├── api.py                  # API endpoints for managing questions and answers
│   ├── config.py               # Configuration settings for the app
│   ├── extensions.py           # Extensions like SQLAlchemy and Marshmallow
│   ├── models.py               # Database models
│   ├── schemas.py              # Schemas for serializing data
│   ├── views.py                # Views and routes for the app
│   ├── templates/              # HTML templates (index.html, question.html, etc.)
│   └── dump.sql                # Database schema in SQL format
├── instance/
│   └── database.db             # SQLite database (if used as fallback)
├── static/
│   └── style.css               # CSS styles for the application
├── venv/                       # Virtual environment (optional)
├── .gitignore                  # Ignored files and folders
├── app.py                      # Main application file
├── create_tables.py            # Script for creating database tables
├── README.md                   # Project documentation
└── requirements.txt            # Python dependencies
