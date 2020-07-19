from flask import Flask, render_template, request, redirect,flash, url_for,session
from flask_sqlalchemy import SQLAlchemy
import datetime


app = Flask(__name__)
app.secret_key = 'Hi-there'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/blog'
db = SQLAlchemy(app)

class Contact(db.Model):
    c_no = db.Column(db.Integer, primary_key = True)
    c_name = db.Column(db.String(30))
    c_phone = db.Column(db.String)
    c_email = db.Column(db.String(50))
    c_msg = db.Column(db.String(250))

class Post(db.Model):
    p_no = db.Column(db.Integer, primary_key = True)
    p_slug = db.Column(db.String(59))
    p_title = db.Column(db.String(50))
    p_image = db.Column(db.String)
    p_content = db.Column(db.String)
    p_by = db.Column(db.String)
    p_date = db.Column(db.String)
    p_time = db.Column(db.String)

def slug_maker(title):
    title = title.lower()
    arr = title.split()
    return "-".join(arr)

def get_time(today):
    return str(today).split()[1].split(".")[0]

@app.route("/")
def home():
    posts = Post.query.filter_by().all()
    return render_template("index.html", posts = posts)

@app.route("/about")
def about():
    return render_template("about.html")

@app.route('/new_post', methods = ['GET', 'POST'])
def post_new():
    if request.method == 'POST':
        post_title = request.form.get('title')
        post_slug = slug_maker(post_title)
        post_image = ""
        post_content = request.form.get('content')
        post_by = session['user'].capitalize()
        post_date = datetime.date.today()
        post_time = get_time(datetime.datetime.now())
        entry = Post(p_slug = post_slug, p_title = post_title, p_image = post_image, p_content = post_content, p_by = post_by, p_date = post_date, p_time = post_time)
        db.session.add(entry)
        db.session.commit()
        return redirect("/dashboard")
    return render_template("new_post.html")
    

@app.route("/update/<string:slug>", methods = ['GET','POST'])
def update(slug):
    if request.method == 'POST':
        post = Post.query.filter_by(p_slug = slug).first()
        post.p_slug = slug_maker(request.form.get('title'))
        post.p_title = request.form.get('title')
        post.p_image = post.p_image
        post.p_content = request.form.get('content')
        post.p_by = post.p_by
        post.p_date = post.p_date
        post.p_time = post.p_time
        db.session.commit()
        return redirect("/dashboard")
    return redirect('/dashboard')
        

@app.route("/edit/<string:slug>")
def edit(slug):
    post = Post.query.filter_by(p_slug = slug).first()
    return render_template("edit.html", post = post)

@app.route("/post/<string:slug>")
def post_content(slug):
    if not slug == "": 
        post = Post.query.filter_by(p_slug = slug).first()
        return render_template("post.html", post = post)
    else:
        return redirect("/")

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")

@app.route("/dashboard", methods = ['GET', 'POST'])
def dashboard():
    flag = False
    posts = Post.query.filter_by().all()
    if 'user' in session and session['user'] == 'pranjal':
        return render_template('dashboard.html', flag = False, posts = posts)
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if username == "pranjal" and password == "pranjal":
            session['user'] = username
            return render_template('dashboard.html', flag = True, posts = posts)
        else:
            flash("Please enter a correct username or password", "warning")
            return redirect('/dashboard')
    return render_template('login.html')

@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    message = ''
    if request.method == 'POST':
        name = request.form.get('name')
        phone = request.form.get('phone')
        email =  request.form.get('email')
        msg = request.form.get('msg')
        entry = Contact(c_name = name, c_phone = phone, c_email = email, c_msg = msg)
        db.session.add(entry)
        db.session.commit()
        flash("Your message has been submitted successfully", "success")
        return redirect("/contact")
    return render_template("contact.html", message = message)

app.run(debug=True)