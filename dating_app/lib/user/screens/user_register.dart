// import 'package:dating_app/user/bloc/user_bloc.dart';
import 'package:dating_app/user/bloc/user_event.dart';
import 'package:dating_app/user/models/models.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a full name';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'full name'),
                onSaved: (value) {
                  this._user['name'] = value;
                },
              ),
              TextFormField(
                initialValue: '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter User name';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'user name'),
                onSaved: (value) {
                  this._user['username'] = value;
                },
              ),
              TextFormField(
                initialValue: '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter email';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'email'),
                onSaved: (value) {
                  this._user['email'] = value;
                },
              ),
              TextFormField(
                initialValue: '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'password'),
                onSaved: (value) {
                  this._user['password'] = value;
                },
              ),
              TextFormField(
                initialValue: '',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter address';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'address'),
                onSaved: (value) {},
              ),
              ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    UserCreate(
                      User(
                          id: this._user['id'],
                          username: this._user['username'],
                          name: this._user['name'],
                          email: this._user['email'],
                          password: this._user['password'],
                          address: this._user['address']),
                    );
                    // BlocProvider.of<UserBloc>(context).add();
                  }
                },
                child: Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
