import 'package:coffeebrew/constants.dart';
import 'package:coffeebrew/screens/loading.dart';
import 'package:coffeebrew/screens/login_screen.dart';
import 'package:coffeebrew/services/auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = "";
  String password = "";
  bool securePassword = false;
  final _formKey = GlobalKey<FormState>();
  AuthService _auth = AuthService();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingWidget()
        : Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: AssetImage('assets/images/coffeeintro.jpeg'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: MediaQuery.of(context).size.height / 2,
                    bottom: 48.0,
                    left: 10.0,
                    right: 10.0,
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create an Account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Personalize your cofee!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Enter a valid email';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            email = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.email,
                                            color: ktextfieldIconcolor,
                                          ),
                                          labelText: 'EMAIL',
                                          labelStyle: ktextfieldStyle,
                                        ),
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.length < 6) {
                                            return 'Password length must be greater than 6 Characters';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        },
                                        obscureText: securePassword,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              Icons.visibility,
                                              color: ktextfieldIconcolor,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                securePassword =
                                                    !securePassword;
                                              });
                                            },
                                          ),
                                          icon: Icon(
                                            Icons.lock,
                                            color: ktextfieldIconcolor,
                                          ),
                                          labelText: 'PASSWORD',
                                          labelStyle: ktextfieldStyle,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(16),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                RaisedButton(
                                                  splashColor: Colors.black,
                                                  color: Color.fromRGBO(
                                                      242, 178, 2, 1),
                                                  onPressed: () async {
                                                    if (_formKey.currentState
                                                        .validate()) {
                                                      setState(() {
                                                        loading = true;
                                                      });
                                                      dynamic result = await _auth
                                                          .registerWithEmailandPassword(
                                                              email, password);
                                                      if (result == null) {
                                                        setState(() {
                                                          loading = false;
                                                        });
                                                      }
                                                      print(email);
                                                      print(password);
                                                    }
                                                  },
                                                  child: Text(
                                                    'Register',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(16),
                                          child: SizedBox(
                                            height: 50,
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                    'Already have an account?'),
                                                RaisedButton(
                                                  splashColor: Color.fromRGBO(
                                                      242, 178, 2, 1),
                                                  elevation: 0,
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              LoginScreen(),
                                                        ));
                                                  },
                                                  child: Text(
                                                    'Login',
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide(
                                                        color: Colors.black26,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
