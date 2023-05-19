# IMPORT ALL REQUIRED PACKAGES

# IMPORT ALL REQUIRED FILES
# LIBRARY FUNCTION

# CLEAN UP SENTENCES - TOKENIZE, LEMMATIZE USER REQUEST
# BOW - INDEXING USER REQUEST
# PREDICT CLASS FROM MODEL DATA
# GETTING CHATBOT RESPONSE
# CHATBOT REQUEST & RESPONSE

# CREATING FLASK SESSION
# MY SQL CONNECTION

# INDEX PAGE
# USER REGISTRTION PAGE
# USER REGISTRTION VALIDATION
# USER LOGIN PAGE
# USER LOGIN
# HANDLING BOT RESPONSE
# USER FEEDBACK
# USER LOGOUT

# ADMIN LOGIN PAGE
# ADMIN LOGIN VALIDATION
# ADMIN DASHBOARD
# ADD NEW QUERY BASED ON FEEDBACK
# REMOVING FEEDBACK
# ADMIN LOGOUT

# MAIN

# IMPORT ALL REQUIRED PACKAGES
from flask import Flask, render_template, request, redirect, session, flash,request
from nltk.stem import WordNetLemmatizer
from keras.models import load_model
from langdetect import detect
import os
import pygame
from gtts import gTTS
import string
import mysql.connector
import os
import nltk
import pickle
import numpy as np
import json
import random

#IMPORT ALL REQUIRED FILES
model = load_model('model.h5')
intents=json.loads(open('data.json', 'r', encoding='utf-8').read())
words = pickle.load(open('texts.pkl','rb'))
classes = pickle.load(open('labels.pkl','rb'))

# LIBRARY FUNCTION
nltk.download('popular')
lemmatizer = WordNetLemmatizer()

# CLEAN UP SENTENCES - TOKENIZE, LEMMATIZE USER REQUEST
def clean_up_sentence(sentence):
    # TOKENIZE USER REQUEST
    sentence_words = nltk.word_tokenize(sentence)

    # LEMMATIZE TOKEN - GETTING THE ROOT FORM OF THE WORD
    sentence_words = [lemmatizer.lemmatize(word.lower()) for word in sentence_words]
    return sentence_words

#BOW - INDEXING USER REQUEST
def bow(sentence, words, show_details=True):
    # TOKENIZING USER REQUEST
    sentence_words = clean_up_sentence(sentence)

    # BAG OF WORDS - MATRIX OF N WORDS, VOCABULARY MATRIX - INDEXING
    bag = [0]*len(words)
    for s in sentence_words:
        for i,w in enumerate(words):
            if w == s:
                # ASSIGN 1 IF CURRENT WORD IS IN THE VOCABULARY POSITION
                bag[i] = 1
                if show_details:
                    print ("found in bag: %s" % w)
    return(np.array(bag))

#PREDICT CLASS FROM MODEL DATA
def predict_class(sentence, model):
    # FILTER OUT PREDICTIONS BELOW A THRESHOLD - HANDLING USER REQUEST
    p = bow(sentence, words,show_details=False)

    # PREDICT CLASS FRO MODEL
    res = model.predict(np.array([p]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i,r] for i,r in enumerate(res) if r>ERROR_THRESHOLD]

    # SORT BY STRENGTH OF PROBABILITY
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    for r in results:
        return_list.append({"intent": classes[r[0]], "probability": str(r[1])})
    return return_list

# DETECT ENGLISH LANGUAGE
def is_english(CHATBOT_RESPONSE):
    if detect(CHATBOT_RESPONSE)=="en":
        return True
    english_letters = set(string.ascii_letters)
    for char in CHATBOT_RESPONSE:
        if char not in english_letters:
            return False
    return True

def is_bangla(CHATBOT_RESPONSE):
    if detect(CHATBOT_RESPONSE)=="bn":
        return True
    else:
        return False

#REMOVE MP3 FILE
def remove_file(filepath):
    if os.path.exists(filepath):
        os.remove(filepath)    

def bangla_voice(text):
        #MAKING THE AUDIO
    global filepath
    tts = gTTS(text=text, lang='bn')
    filename='voice_response_'+str(random.randint(0, 9))+'.mp3'
    filepath = os.path.join('static', 'audio', filename).replace('\\', '/')
    remove_file(filepath)
    tts.save(filepath)

    # Initialize Pygame
    pygame.display.init()
    pygame.mixer.init()

    # Play audio file
    pygame.mixer.music.load(filepath)
    pygame.mixer.music.play()
    endevent = pygame.USEREVENT + 1
    pygame.mixer.music.set_endevent(endevent)
    while True:
        for event in pygame.event.get():
            if event.type == endevent:
                pygame.mixer.music.stop()
                pygame.display.quit()
                return
        pygame.time.Clock().tick(10)

def english_voice(text):
        #MAKING THE AUDIO
    global filepath
    tts = gTTS(text=text, lang='en')
    filename='voice_response_'+str(random.randint(0, 9))+'.mp3'
    filepath = os.path.join('static', 'audio', filename).replace('\\', '/')
    remove_file(filepath)
    tts.save(filepath)

    # Initialize Pygame
    pygame.display.init()
    pygame.mixer.init()

    # Play audio file
    pygame.mixer.music.load(filepath)
    pygame.mixer.music.play()
    endevent = pygame.USEREVENT + 1
    pygame.mixer.music.set_endevent(endevent)
    while True:
        for event in pygame.event.get():
            if event.type == endevent:
                pygame.mixer.music.stop()
                pygame.display.quit()
                return
        pygame.time.Clock().tick(10)

def voice_response(CHATBOT_RESPONSE):
    if is_bangla(CHATBOT_RESPONSE):
        return bangla_voice(CHATBOT_RESPONSE)
    elif is_english(CHATBOT_RESPONSE):
        return english_voice(CHATBOT_RESPONSE)

#GETTING CHATBOT RESPONSE
def getResponse(ints, intents_json):
    tag = ints[0]['intent']
    list_of_intents = intents_json['intents']
    for i in list_of_intents:
        if(i['tag']== tag):
            result = random.choice(i['responses'])
            break
    return result

# CHATBOT REQUEST & RESPONSE
def chatbot_response(msg):
    # CHATBOT REQUEST
    ints = predict_class(msg, model)

    # CHATBOT RESPONSE
    res = getResponse(ints, intents)
    return res

#=============================================CREATING FLASK SESSION=============================================#
app = Flask(__name__, static_url_path='/static')
app.secret_key = os.urandom(24)

#=============================================MY SQL CONNECTION=============================================#
conn = mysql.connector.connect(host="localhost", user="root", password="", database="chatbot_application")
cursor = conn.cursor()

#=============================================INDEX PAGE=============================================#
@app.route('/')
def index():
    return render_template('index.html')

#=============================================USER REGISTRTION PAGE=============================================#
@app.route('/register')
def register():
    # IF USER IS LOGGED, REDIRECT INDEX PAGE
    if 'user_id' in session:
        return redirect('/')

    # IF USER IS NOT LOGGED, REDIRECT REGISTRATION PAGE
    else:
        return render_template('registration.html')

#=============================================USER REGISTRTION VALIDATION=============================================#
@app.route('/register_validation', methods=['POST'])
def register_validation():

    #GETTING DATA
    fname = request.form.get('fname')
    lname = request.form.get('lname')
    email = request.form.get('email')
    pwd = request.form.get('pwd')

    #PASSWORD VALIDATION
    if not len(pwd) >= 5:
        flash('Password must be at least 5 characters in length')
        return render_template('registration.html')
    else:
        #INSERTING DATA
        cursor.execute("INSERT INTO user (fname,lname,email,pwd) VALUES (%s,%s,%s,%s)", (fname, lname, email, pwd))
        conn.commit()

        #REDIRECTING HOME
        flash('Registration Successfully!')
        return redirect('/')

# =============================================USER LOGIN PAGE=============================================#
@app.route('/login')
def login():
    if 'user_id' in session:
        return redirect('/')
    else:
        if 'admin_id' in session:
            session.pop('admin_id')
        return render_template('login.html')

# =============================================USER LOGIN=============================================#
@app.route('/login_validation', methods=['POST'])
def login_validation():
    # REMOVING ADMIN SESSION
    if 'admin_id' in session:
        session.pop('admin_id')

    # GETTING DATA
    email = request.form.get('email')
    pwd = request.form.get('pwd')

    # CHECKING DATABASE
    cursor.execute("SELECT * FROM user WHERE email = %s AND pwd = %s ", (email, pwd))
    users = cursor.fetchall()

    # PASSWORD VALIDATION
    if len(users) > 0:
        session['user_id'] = users[0][3]
        flash('Logged in Successfully!')
        return redirect('/')
    else:
        flash('Entered Details already exists or are  Invalid Password ')
        return redirect('/')

#=============================================HANDLING BOT RESPONSE=============================================#
@app.route("/get")
def get_bot_response():
    # GETTING USER TEXT
    global USER_TEXT, CHATBOT_RESPONSE
    USER_TEXT = request.args.get('msg')

    if is_bangla(USER_TEXT) or is_english(USER_TEXT):
        # GETTING BOT RESPONSE, ACCORDING TO USER REQUEST
        CHATBOT_RESPONSE = chatbot_response(USER_TEXT)
        voice_response(CHATBOT_RESPONSE)
        # INSERTING USER REQUEST & BOT RESPONSE
        cursor.execute("INSERT INTO queries(user_id, user_text, chatbot_response) VALUES (%s,%s,%s)",(session["user_id"], USER_TEXT, CHATBOT_RESPONSE))
        conn.commit()
    else:
        CHATBOT_RESPONSE="Invalid Language"

    return CHATBOT_RESPONSE

#=============================================USER FEEDBACK=============================================#
@app.route('/user_feedback', methods=['POST'])
def user_feedback():
    #GETTING DATA
    feed_back_type = request.form.get('feed_back_type')
    feed_back_msg = request.form.get('feed_back_msg')

    #INSERTING INTO DATABASE
    cursor.execute("INSERT INTO feed_back(feed_back_msg,feed_back_type,user_text,bot_response) VALUES (%s,%s,%s,%s)",(feed_back_msg,feed_back_type,USER_TEXT,CHATBOT_RESPONSE))
    conn.commit()

    #SUCCESSFULL SUBMISSION
    flash("Feedback Submitted")
    return redirect('/')

#=============================================USER LOGOUT=============================================#
@app.route('/logout')
def logout():
    if 'user_id' in session:
        session.pop('user_id')
        return redirect('/login')
    else:
        return  redirect('/')
# =============================================ADMIN LOGIN PAGE=============================================#
@app.route('/admin/login')
def admin_login():
    # IF ADMIN IS LOGGED, THEN REDIRCT DASHBOARD
    if 'admin_id' in session:
        return redirect('/admin')

    # IF ADMIN IS NOT LOGGED, THEN REDIRECT LOGIN PAGE
    else:
        if 'user_id' in session:
            session.pop('user_id')
        return render_template('admin_login.html')

# =============================================ADMIN LOGIN VALIDATION=============================================#
@app.route('/admin/login_validation', methods=['POST'])
def admin_login_validation():
    # REMOVE LOGGED USER
    if 'user_id' in session:
        session.pop('user_id')

    # GETTING DATA
    email = request.form.get('email')
    pwd = request.form.get('pwd')

    # CHECKING DATABASE
    cursor.execute("SELECT * FROM admin WHERE email = %s AND pwd = %s ", (email, pwd))
    users = cursor.fetchall()

    # FOR RIGHT INFORMATION SET SESSSION & ADMIN LOGGED
    if len(users) > 0:
        session['admin_id'] = users[0][0]
        flash('Logged in Successfully!')
        return redirect('/admin')
    # FOR FALSE INFORMATION ERRRO MESSAGE
    else:
        flash('Invalid Credentials')
        return redirect('/')

#=============================================ADMIN DASHBOARD=============================================#
@app.route('/admin')
def admin():
    #IF ADMIN IS LOOGGED, THEN RENDER DASHBOARD
    if 'admin_id' in session:

        cursor.execute("SELECT id,feed_back_msg, user_text, bot_response FROM feed_back WHERE feed_back_type=(%s)",("false",))
        feedback_data = cursor.fetchall()
        conn.commit()

        return render_template('admin.html',feedback_data=feedback_data)
    #IF ADMIN IS NOT LOGGED, THEN REDIRECT TO ADMIN LOGIN PAGE
    else:
        return redirect('/admin/login')

#=============================================ADD NEW QUERY BASED ON FEEDBACK=============================================#
@app.route('/add_query', methods=['POST'])
def add_query():
    #GETTING DATA
    tag=request.form.get('tag')
    patterns=request.form.get('patterns')
    responses=request.form.get('responses')
    context=request.form.get('context')
    id=request.form.get('eidtable_feed_back_id')

    #INSERTING & REMOVING FROM DATABASE
    cursor.execute("INSERT INTO new_query_data(id, tag, patterns, responses, context) VALUES (%s,%s,%s,%s,%s)",(id,tag,patterns,responses,context))
    cursor.execute("DELETE FROM feed_back WHERE id=(%s)",(id))
    conn.commit()

    #SUCCESSFULL EXECUTION
    flash("Query Added")
    return redirect('/admin')

#=============================================REMOVING FEEDBACK=============================================#
@app.route('/delete_feedback', methods=['POST'])
def delete_feedback():
    #GETTING FEEDBACK ID
    id = request.form.get('id')

    #REMOVING FROM DATABASE
    cursor.execute("DELETE FROM feed_back WHERE id=(%s)",(id))
    conn.commit()

    #SUCCESSFUL EXECUTION
    flash("Feedback Deleted")
    return redirect('/admin')

#=============================================ADMIN LOGOUT=============================================#
@app.route('/admin_logout')
def admin_logout():
    session.pop('admin_id')
    return redirect('/admin/login')

#=============================================MAIN=============================================#
if __name__ == "__main__":
    app.run(debug=True)