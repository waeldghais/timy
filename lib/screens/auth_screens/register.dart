import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:TimyTimeMain/services/auth_service.dart';
import 'package:TimyTimeMain/styling/loading.dart';

class Register extends StatefulWidget {
  Register({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: AssetImage('assets/sign-up.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: Center(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailAndPaswword(email, password);
                            if (result == null) {
                              setState(
                                  () => error = 'please supply a valid email');
                              loading = false;
                            }
                            print(email);
                            print(password);
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.red[700]),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 38.0, left: 38.0, right: 38.0, bottom: 130.0),
                  child: Form(
                    
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 400,
                          height: 50.0,
                          child: TextFormField(
                              obscureText: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.center,
                              // controller: _textFieldController,
                              decoration: InputDecoration(
                                fillColor: Hexcolor('#efba29'),
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              validator: (val) => val.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              }),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 38.0, left: 38.0, right: 38.0, bottom: 200.0),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 400,
                          height: 50.0,
                          child: TextFormField(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.center,
                              // controller: _textFieldController,
                              decoration: InputDecoration(
                                fillColor: Hexcolor('#efba29'),
                                filled: true,
                                hintText: "Enter your email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              }),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 300.0),
                  child: Center(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Log In Now',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
