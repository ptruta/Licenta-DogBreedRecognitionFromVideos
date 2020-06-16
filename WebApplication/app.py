import os
from flask import Flask, request, redirect, url_for, render_template, send_from_directory, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
from werkzeug.utils import secure_filename
from tensorflow_model.predictVideo import predict_video as model_predict
from keras.preprocessing import image
import json
from PIL import Image as PImage
import cv2
import time
import datetime
from flask_paginate import Pagination, get_page_parameter


ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'mp4'])
UPLOAD_FOLDER = 'uploads'

app = Flask(__name__,static_folder='C:\\Users\\win10\\Documents\\pati\\Licenta\\WebApplication\\static')
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = 'your secret key'

# Enter your database connection details below
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'dog_breed_login'

# Intialize MySQL
mysql = MySQL(app)

uploadElem = ""
nr=0

filePathForUploadExistingBreed = 'C:/Users/win10/Documents/pati/Licenta/dog-breed-identification/train/'
pathForStatic = 'static/exactImages'

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
		   
@app.route('/', methods=['GET', 'POST'])
def login():
    # Output message if something goes wrong...
	msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
	if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        # Create variables for easy access
		username = request.form['username']
		password = request.form['password']
        # Check if account exists using MySQL
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('SELECT * FROM accounts WHERE username = %s AND password = %s', (username, password,))
        # Fetch one record and return result
		account = cursor.fetchone()
        # If account exists in accounts table in out database
		# Create session data, we can access this data in other routes
		if account:
			session['loggedin'] = True
			session['id'] = account['id']
			session['username'] = account['username']
			return redirect(url_for('upload_file'))
		else:
			# Account doesnt exist or username/password incorrect
			msg = 'Incorrect username/password!'
	# Show the login form with message (if any)
	return render_template('login.html', msg=msg)
	
	
# http://localhost:5000/pythinlogin/register - this will be the registration page, we need to use both GET and POST requests
@app.route('/register', methods=['GET', 'POST'])
def register():
	# Output message if something goes wrong...
	msg = ''
	# Check if "username", "password" and "email" POST requests exist (user submitted form)
	if request.method == 'POST' and 'username' in request.form and 'password' in request.form and 'email' in request.form:
		# Create variables for easy access
		username = request.form['username']
		password = request.form['password']
		email = request.form['email']
		# Check if account exists using MySQL
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('SELECT * FROM accounts WHERE username = %s', (username,))
		account = cursor.fetchone()
		# If account exists show error and validation checks
		if account:
			msg = 'Account already exists!'
		elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
			msg = 'Invalid email address!'
		elif not re.match(r'[A-Za-z0-9]+', username):
			msg = 'Username must contain only characters and numbers!'
		elif not username or not password or not email:
			msg = 'Please fill out the form!'
		else:
			# Account doesnt exists and the form data is valid, now insert new account into accounts table
			cursor.execute('INSERT INTO accounts VALUES (NULL, %s, %s, %s)', (username, password, email))
			mysql.connection.commit()
			msg = 'You have successfully registered!'
	elif request.method == 'POST':
		# Form is empty... (no POST data)
		msg = 'Please fill out the form!'
	# Show registration form with message (if any)
	return render_template('register.html', msg=msg)


@app.route('/firstPage', methods=['GET', 'POST'])
def upload_file():
	if 'loggedin' in session:
        # User is loggedin show them the index page
		if request.method == 'POST':
			file = request.files['file']

			if file and allowed_file(file.filename):
				filename = secure_filename(file.filename)
				
				file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

				theExactPhotoOfBreed, image_pred, confidence, name, behavior, height, weight, life_expectancy = model_predict(file)
				
				messages = {
					'file': 'uploads/' + filename,
					'theExactPhotoOfBreed' : str(theExactPhotoOfBreed),
					'image_pred': str(image_pred),
					'confidence': str(confidence),
					'name' : str(name),
					'behavior' : str(behavior),
					'height' : str(height),
					'weight' : str(weight),
					'life_expectancy' : str(life_expectancy)
				}
				
				cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
				cursor.execute('INSERT INTO uploads VALUES (NULL, %s, %s, %s, %s, %s)', (messages['file'], str(datetime.datetime.now()), name, confidence, session['id']))
				mysql.connection.commit()
				
				messages = json.dumps(messages)
				return redirect(url_for('file_predict', messages=messages))
		return render_template('index.html', username=session['username'])

@app.route('/uploads/<filename>')
def send_file(filename):
	if 'loggedin' in session:
		return send_from_directory(UPLOAD_FOLDER, filename)

@app.route('/predict')
def file_predict():
	if 'loggedin' in session:
		messages = request.args['messages']
		messages = json.loads(messages)
		
		if messages['theExactPhotoOfBreed'] != '':
			theImage = image.load_img(filePathForUploadExistingBreed + messages['theExactPhotoOfBreed'])
			time1 = str(time.time())
			theImage.save(('static/exactImages/frame{:s}.jpg').format(time1))
			return render_template('predict.html', 
			frame=('/exactImages/frame{:s}.jpg').format(time1),
			predicted_value=messages['image_pred'], 
			predicted_confidence=messages['confidence'],
			image=messages['file'],
			name=messages['name'],
			behavior=messages['behavior'],
			height=messages['height'],
			weight=messages['weight'],
			life_expectancy=messages['life_expectancy'])
		else:
			return render_template('predict.html', 
			frame=('/NO/no_recognition.jpg'),
			predicted_value=messages['image_pred'], 
			predicted_confidence=messages['confidence'],
			image=messages['file'],
			name=messages['name'],
			behavior=messages['behavior'],
			height=messages['height'],
			weight=messages['weight'],
			life_expectancy=messages['life_expectancy'])
			
		return render_template('predict.html', 
			frame=('/exactImages/frame{:s}.jpg').format(time1),
			predicted_value=messages['image_pred'], 
			predicted_confidence=messages['confidence'],
			image=messages['file'],
			name=messages['name'],
			behavior=messages['behavior'],
			height=messages['height'],
			weight=messages['weight'],
			life_expectancy=messages['life_expectancy'])

@app.route('/profile')
def profile():
	# Check if user is loggedin
	if 'loggedin' in session:
		# We need all the account info for the user so we can display it on the profile page
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('SELECT * FROM accounts WHERE id = %s', (session['id'],))
		account = cursor.fetchone()
		
		page = request.args.get('page', 0, type=int)
		
		perpage=1
		startat=page*perpage
		
		prev_page = page - 1
		next_page = page + 1
		
		# We need to display one of the uploads
		cursor1 = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor1.execute('SELECT * FROM uploads WHERE account_id = %s LIMIT %s, %s', (session['id'], startat, perpage,))
		
		# We need to display all of the uploads
		cursor2 = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor2.execute('SELECT * FROM uploads WHERE account_id = %s', (session['id'],))
		uploadsElems = cursor2.fetchall()
	
		records = cursor1.fetchall()
									
		# Show the profile page with account info
		return render_template('profile.html', account=account, records=records, len=len(records), lengthForUploads=len(uploadsElems), next_page=next_page, prev_page=prev_page, page=page)
	# User is not loggedin redirect to login page
	return redirect(url_for('login'))
	
@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
	session.pop('loggedin', None)
	session.pop('id', None)
	session.pop('username', None)
	#delete the contents of the folder FolderSeconds
	import os, shutil
	folder = pathForStatic
	for filename in os.listdir(folder):
		file_path = os.path.join(folder, filename)
		try:
			if os.path.isfile(file_path) or os.path.islink(file_path):
				os.unlink(file_path)
			elif os.path.isdir(file_path):
				shutil.rmtree(file_path)
		except Exception as e:
			print('Failed to delete %s. Reason: %s' % (file_path, e))
	# Redirect to login page
	return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(port=5002, debug=True)
