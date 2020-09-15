import 'package:coffeebrew/constants.dart';
import 'package:coffeebrew/screens/registration_screen.dart';
import 'package:coffeebrew/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            'Welcome',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Sign in to continue!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: ktextfieldIconcolor,
                              ),
                              labelText: 'EMAIL',
                              labelStyle: ktextfieldStyle,
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.visibility,
                                  color: ktextfieldIconcolor,
                                ),
                                onPressed: () {},
                              ),
                              icon: Icon(
                                Icons.lock,
                                color: ktextfieldIconcolor,
                              ),
                              labelText: 'PASSWORD',
                              labelStyle: ktextfieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            splashColor: Colors.black,
                            color: Color.fromRGBO(242, 178, 2, 1),
                            onPressed: () {},
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Forgot Password?'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            splashColor: Color.fromRGBO(242, 178, 2, 1),
                            elevation: 0,
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => RegistrationScreen(),
                                  ));
                            },
                            child: Text(
                              'Register',
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Colors.black26,
                                )),
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
                          child: RaisedButton(
                            splashColor: Color.fromRGBO(242, 178, 2, 1),
                            elevation: 0,
                            color: Colors.white,
                            onPressed: () async {
                              dynamic result = await authService.signinanon();
                              if (result == null) {
                                print("error signing in");
                              } else {
                                print("Signed in:");
                                print(result.userId);
                              }
                            },
                            child: Text(
                              'Signin Anonymously!',
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Colors.black26,
                                )),
                          ),
                        ),
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
