from flask import Flask, render_template, request, redirect,flash, url_for,session
from flask_sqlalchemy import SQLAlchemy


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


@app.route("/")
def home():
    posts = Post.query.filter_by().all()
    return render_template("index.html", posts = posts)

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")

@app.route("/dashboard", methods = ['GET', 'POST'])
def dashboard():
    flag = False
    if 'user' in session and session['user'] == 'pranjal':
        return render_template('dashboard.html', flag = False)
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if username == "pranjal" and password == "pranjal":
            session['user'] = username
            return render_template('dashboard.html', flag = True)
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