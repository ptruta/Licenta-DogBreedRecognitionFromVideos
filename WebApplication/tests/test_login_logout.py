from flask import Flask
from flask_mysqldb import MySQL
import MySQLdb.cursors

def test_account_register():
        app = Flask(__name__,static_folder='C:\\Users\\win10\\Documents\\pati\\Licenta\\WebApplication\\static')
        # Change this to your secret key (can be anything, it's for extra protection)
        app.secret_key = 'your secret key'
        # Enter your database connection details below
        app.config['MYSQL_HOST'] = 'localhost'
        app.config['MYSQL_USER'] = 'root'
        app.config['MYSQL_PASSWORD'] = 'root'
        app.config['MYSQL_DB'] = 'dog_breed_login'
        with app.app_context():
            mysql = MySQL(app)
            username = 'elena'
            password = 'elena'
            email = 'elena@yahoo.com'
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            cursor.execute('INSERT INTO accounts VALUES (NULL, %s, %s, %s)', (username, password, email))
            mysql.connection.commit()
            cursor.execute('SELECT * FROM accounts WHERE username = %s', ('elena',))
            account = cursor.fetchone()
            assert account['username'] in 'elena'
            cursor.execute('DELETE FROM accounts WHERE username = %s', ('elena',))