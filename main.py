from flask import Flask, render_template, request, redirect,flash, url_for,session
from flask_sqlalchemy import SQLAlchemy
import datetime, math


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
    p_content = db.Column(db.String)
    p_by = db.Column(db.String)
    p_email = db.Column(db.String(50))
    p_date = db.Column(db.String)
    p_time = db.Column(db.String)


class User(db.Model):
    sl_no = db.Column(db.Integer, primary_key = True)
    f_name = db.Column(db.String(20))
    l_name = db.Column(db.String(20))
    email = db.Column(db.String(50))
    phone = db.Column(db.String(10))
    password = db.Column(db.String(15))
    dob = db.Column(db.String)

def slug_maker(title):
    title = title.lower()
    arr = title.split()
    return "-".join(arr)


def get_time(today):
    return str(today).split()[1].split(".")[0]


@app.route("/")
def home():
    posts = Post.query.filter_by().all()
    last = math.ceil(len(posts)/4)
    page = request.args.get('page')
    if not str(page).isdigit():
        page = 1
    page = int (page)
    posts = posts[( page - 1 ) * 4 : (( page - 1 ) * 4) + 4]
    if page == 1:
        p = "#"
        if page == last :
            n = "#"
        else:
            n = "/?page=" + str(page+1)
    elif page == last:
        p = "/?page=" + str(page-1)
        n = "#"
    else:
        p = "/?page=" + str(page-1)
        n = "/?page=" + str(page+1)
    return render_template("index.html", posts = posts, old = p, new = n)


@app.route('/signup', methods = ['GET', 'POST'])
def signup():
    if 'user' not in session:
        flag = False
        if request.method == 'POST':
            a = []
            a.append(request.form.get('fname'))
            a.append(request.form.get('lname'))
            a.append(request.form.get('email').lower())
            a.append(request.form.get('phone'))
            a.append(request.form.get('pass'))
            a.append(request.form.get('dob'))
            u = User.query.filter_by(email = a[2]).first()
            if u:
                flash("Email address already registered. Please use a different email address or log in", 'warning')
                return render_template("signup.html",flag = True, arr = a)
            
            entry = User(f_name = a[0], l_name = a[1], email = a[2], phone = a[3], password = a[4], dob = a[5])
            db.session.add(entry)
            db.session.commit()
            flash('You registration has been completes. Please sign in', 'success')
            return render_template("login.html")
        return render_template("signup.html")
    else:
        return redirect("/dashboard")


@app.route("/about")
def about():
    return render_template("about.html")


@app.route('/new_post', methods = ['GET', 'POST'])
def post_new():
    if 'user' in session:
        if request.method == 'POST':
            post_user = User.query.filter_by(email = session['user']).first()
            post_title = request.form.get('title')
            post_slug = slug_maker(post_title)
            post_content = request.form.get('content')
            post_by = post_user.f_name.capitalize()
            post_email = session['user']
            post_date = datetime.date.today()
            post_time = get_time(datetime.datetime.now())
            entry = Post(p_slug = post_slug, p_title = post_title, p_content = post_content, p_by = post_by, p_email = post_email, p_date = post_date, p_time = post_time)
            db.session.add(entry)
            db.session.commit()
            flash("Your post has been published", "success")
            return redirect("/dashboard")
        return render_template("new_post.html")
    else:
        return redirect('/dashboard')
    

@app.route("/update/<string:slug>", methods = ['GET','POST'])
def update(slug):
    user_fetch = Post.query.filter_by(p_slug = slug).first().p_email
    if 'user' in session and session['user'] == user_fetch:
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
            flash("Your post has been updated", "success")
            return redirect("/dashboard")
        return redirect('/dashboard')
    else:
        flash = ("That's not your post", "danger")
        return redirect('/dashboard')
        

@app.route("/edit/<string:slug>")
def edit(slug):
    user_fetch = Post.query.filter_by(p_slug = slug).first().p_email
    if 'user' in session and session['user'] == user_fetch:
        post = Post.query.filter_by(p_slug = slug).first()
        return render_template("edit.html", post = post)
    else:
        return redirect("/dashboard")


@app.route("/post/<string:slug>")
def post_content(slug):
    if not slug == "": 
        post = Post.query.filter_by(p_slug = slug).first()
        return render_template("post.html", post = post)
    else:
        return redirect("/")


@app.route("/logout")
def logout():
    if 'user' in session:
        session.pop('user')
        return redirect("/dashboard")
    else:
        return redirect("/dashboard")


@app.route('/delete/<string:slug>')
def delete(slug):
    user_fetch = Post.query.filter_by(p_slug = slug).first().p_email
    if 'user' in session and session['user'] == user_fetch:
        post = Post.query.filter_by(p_slug = slug).first()
        db.session.delete(post)
        db.session.commit()
        flash('The post has been deleted', 'danger')
        return redirect("/dashboard")
    else:
        flash = ("That's not your post", "danger")
        return redirect("/dashboard")


@app.route("/dashboard", methods = ['GET', 'POST'])
def dashboard():
    flag = False
    if 'user' in session:
        posts = Post.query.filter_by(p_email = session['user'])
        user = User.query.filter_by(email = session['user'])
        return render_template('dashboard.html', flag = False, posts = posts, user = user)
    if request.method == 'POST':
        email = request.form.get('email').lower()
        password = request.form.get('password')
        user_fetch = User.query.filter_by(email = email).first() 
        if user_fetch and password == user_fetch.password:
            session['user'] = email
            posts = Post.query.filter_by(p_email = email)
            user = User.query.filter_by(email = email)
            return render_template('dashboard.html', flag = True, posts = posts, user = user)
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
if __name__ == "__main__":
    app.run(debug=True)