import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Form is valid. Email: $_email, password: $_password');
      return true;
    }
    print('Form is Invalid. Email: $_email, password: $_password');
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        print('Singed in: ${user.uid}');
        Navigator.pushNamed(context, '/home');
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter auth'),
      ),
      body: new Container(
          child: new Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  new TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Email can\'t be empty' : null,
                    onSaved: (value) => _email = value,
                    decoration: new InputDecoration(labelText: 'Email'),
                  ),
                  new TextFormField(
                    obscureText: true, //パスワードが隠れる設定
                    validator: (value) =>
                        value.isEmpty ? 'Password can\'t be empty' : null,
                    onSaved: (value) => _password = value,
                    decoration: new InputDecoration(labelText: 'password'),
                  ),
                  new RaisedButton(
                      child: new Text('Login',
                          style: new TextStyle(fontSize: 20.0)),
                      onPressed: validateAndSubmit),
                ],
              ))),
    );
  }
}
