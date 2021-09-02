from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'patient'
    UserId = db.Column(db.Integer, primary_key=True,autoincrement=True)
    username = db.Column(db.String,nullable=False)
    name = db.Column(db.String,nullable=False)
    email = db.Column(db.String,nullable=False,unique=True)
    password = db.Column(db.String,nullable=False)
    address = db.Column(db.String,nullable=False)

class Choice(db.Model):
    __tablename__ = 'choice'
    ChoiceId = db.Column(db.Integer, primary_key=True, autoincrement=True)
    age = db.Column(db.Integer, nullable=False)
    color = db.Column(db.String, nullable=True)
    salary = db.Column(db.String, nullable=True)
    description = db.Column(db.String, nullable=True)


class Admin(db.Model):
    __tablename__='admin'
    AdminId = db.Column(db.Integer, primary_key=True,autoincrement=True)
    username = db.Column(db.String,nullable=False,unique=True)
    email = db.Column(db.String,nullable=False,unique=True)
    password = db.Column(db.String,nullable=False)

class Comment(db.Model):
    __tablename__="comment"
    commentId = db.Column(db.Integer, primary_key=True,autoincrement=True)
    commentText = db.Column(db.String,nullable=False)
