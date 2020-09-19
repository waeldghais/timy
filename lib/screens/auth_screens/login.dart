import 'package:TimyTimeMain/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// import 'package:TimyTimeMain/styling/constant.dart';
import 'package:TimyTimeMain/styling/loading.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Login extends StatefulWidget {
  // final Function toggleView;
  // Login({this.toggleView});
// facebook related
  final Function goToPageCallback;

  Login({this.goToPageCallback});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

//  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Stack(fit: StackFit.expand, children: <Widget>[
              Container(
                //color: Hexcolor('#4d6d9a'),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage('assets/sign-in.jpg'),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
                  child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 300.0, bottom: 20.0),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                _emailField(),
                                SizedBox(height: 15),
                                _passwordField(),
                                SizedBox(height: 20),
                                _signInBtn(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ]),
          );
  }

  _emailField() {
    return TextFormField(
        style: TextStyle(color: Colors.black, fontSize: 20.0),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            fillColor: Hexcolor('#efba29'),
            filled: true,
            hintText: 'Enter your email',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
        validator: (val) => val.isEmpty ? 'Enter an email' : null,
        onChanged: (val) {
          setState(() => email = val);
        });
  }

  _passwordField() {
    return TextFormField(
        style: TextStyle(color: Colors.black, fontSize: 20.0),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            fillColor: Hexcolor('#efba29'),
            filled: true,
            hintText: 'Enter your password',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
        validator: (val) =>
            val.length < 6 ? 'Enter a password 6+ chars long' : null,
        obscureText: true,
        onChanged: (val) {
          setState(() => password = val);
        });
  }

  _signInBtn() {
    return RaisedButton(
      color: Hexcolor('#efba29'),
      child: Text(
        'Sign in',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          setState(() => loading = true);
          dynamic result =
              await _auth.signInWithEmailAndPaswword(email, password);
          if (result == null) {
            setState(() => error = 'Could not sign in');
            loading = false;
          }
        }
      },
    );
  }
}
