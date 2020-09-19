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

//   void _signInFacebook() async {
//   FacebookLogin facebookLogin = FacebookLogin();

//   final result = await facebookLogin.logIn(['email']);
//   final token = result.accessToken.token;
//   final graphResponse = await http.get(
//             'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
//   print(graphResponse.body);
//   if(result.status == FacebookLoginStatus.loggedIn) {
//     final credential = FacebookAuthProvider.getCredential(accessToken: token);
//     _authface.signInWithCredential(credential);
//   }

// }

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
                          image: AssetImage('assets/sign-in.jpg'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0, bottom: 0.0),
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPaswword(email, password);
                              if (result == null) {
                                setState(() => error = 'Could not sign in');
                                loading = false;
                              }
                            }
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.red[700]),
                          ),
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
