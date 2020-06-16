from tensorflow.python.keras.models import load_model
from tensorflow.python.keras.backend import set_session
from keras.preprocessing import image
from keras.models import load_model
from flask import Flask
from flask_mysqldb import MySQL
import MySQLdb.cursors
import tensorflow as tf
import pandas as pd
import numpy as np
import cv2

app = Flask(__name__,static_folder='C:\\Users\\win10\\Documents\\pati\\Licenta\\WebApplication\\static')
app.secret_key = 'your secret key'

# Enter your database connection details below
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'dog_breed_login'

# Intialize MySQL
mysql = MySQL(app)

global sess
sess = tf.Session()
graph = tf.get_default_graph()

#constants
num_classes = 50 # the number of breeds we want to classify

#Read the csv into a dataframe, group the breeds and 
df = pd.read_csv('C:/Users/win10/Documents/pati/Licenta/dog-breed-identification/labels.csv')
selected_breed_list = list(df.groupby('breed').count().sort_values(by='id', ascending=False).head(num_classes).index)

#take the exact 50 breeds we selected from train folder
df = df[df['breed'].isin(selected_breed_list)]

#Getting the exact breed out TL model think it is
df['filename'] = df.apply(lambda x: (x['id'] + '.jpg'), axis=1)

#Showing Unique Breed Selected:
breeds = pd.Series(df['breed']).unique()

set_session(sess)
model = load_model('tensorflow_model/2020-04-13_dog_breed_model.h5')
pathForUploads = 'C:/Users/win10/Documents/pati/Licenta/WebApplication/uploads/'
pathForUploadedFrames = 'C:/Users/win10/Documents/pati/Licenta/FolderSeconds/'

def CountFrequency(my_list): 
# Creating an empty dictionary  
	freq = {}
	for item in my_list: 
		if (item in freq): 
			freq[item] += 1
		else: 
			freq[item] = 1
	maxValue=0
	maxKey=0
	for key, value in freq.items():
		print ("% s	: % f"%(key, value))
		if value >= maxValue:
			maxValue = value
			maxKey = key
	return maxKey
	
def predict_video(test_video):

	#declaring some used variables
	count = 0
	predicted_class_final = 0
	prediction = 0
	name="We haven't detected a dog"
	behavior="We haven't detected a dog"
	height="We haven't detected a dog"
	weight="We haven't detected a dog"
	life_expectancy="We haven't detected a dog"
	sorted_breeds_list = sorted(selected_breed_list)
	cap = cv2.VideoCapture(pathForUploads+test_video.filename)
	#use this graph in order to can use this session more than one time
	global graph
	myList = []
	listOfProb = []
	theExactPhotoOfBreed = ""
	with graph.as_default():
		set_session(sess)
		while cap.isOpened():
			ret, frame = cap.read()
			if ret:
				cv2.imwrite((pathForUploadedFrames+'frame{:d}.jpg').format(count), frame)
				img = image.load_img((pathForUploadedFrames+'frame{:d}.jpg').format(count), target_size=(299, 299))
				
				img_tensor = image.img_to_array(img)                    # (height, width, channels)
				img_tensor = np.expand_dims(img_tensor, axis=0)         # (1, height, width, channels), add a dimension because the model expects this shape: (batch_size, height, width, channels)
				img_tensor /= 255.  

				#predict the resized photo of 299x299 dimensions
				pred = model.predict(img_tensor)
				predicted_class = sorted_breeds_list[np.argmax(pred)]
				myList.append(predicted_class)
				listOfProb.append("{:.0f}".format(max(pred)[sorted_breeds_list.index(predicted_class)] * 100))
				
				if count < 100:
					count += 30
				elif count < 1000:
					count += 120
				elif count < 10000:
					count += 240
				else:
					count += 480
				cap.set(1, count)
			else:
				cap.release()
					
				maxValue = CountFrequency(myList)
				ind = myList.index(maxValue)
				
				listOfIndices = [index for index, v in enumerate(myList) if v == maxValue]
				
				maxProbability = ""
				maxIndex = 0
				for ind in listOfIndices:
					if listOfProb[ind] >= maxProbability:
						print(maxProbability)
						maxProbability = listOfProb[ind]
				
				if maxProbability >= "90":
					#number of breeds 120
					n=10222
					i=0
					
					while i <= n:
						try:
							if df.at[i,'breed'] == maxValue:
								theExactPhotoOfBreed = df.at[i,'filename']
							i += 1
						except:
							i += 1
					predicted_class_final = maxValue
					prediction = maxProbability
					print("here"+theExactPhotoOfBreed)
				print(predicted_class_final)
				
				cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
				cursor.execute('SELECT * FROM dog_details WHERE id = %s', (predicted_class_final,))
				dog_detail = cursor.fetchone()
					
				if maxValue == predicted_class_final:
					predicted_class_final = maxValue
					prediction = prediction
					theExactPhotoOfBreed = theExactPhotoOfBreed
					name=dog_detail['name']
					behavior=dog_detail['behavior']
					height=dog_detail['height']
					weight=dog_detail['weight']
					life_expectancy=dog_detail['life_expectancy']
					
				#delete the contents of the folder FolderSeconds
				import os, shutil
				folder = pathForUploadedFrames
				for filename in os.listdir(folder):
					file_path = os.path.join(folder, filename)
					try:
						if os.path.isfile(file_path) or os.path.islink(file_path):
							os.unlink(file_path)
						elif os.path.isdir(file_path):
							shutil.rmtree(file_path)
					except Exception as e:
						print('Failed to delete %s. Reason: %s' % (file_path, e))
				break
					
	return theExactPhotoOfBreed, predicted_class_final, prediction, name, behavior, height, weight, life_expectancy