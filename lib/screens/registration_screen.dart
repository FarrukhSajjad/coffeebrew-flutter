import 'package:coffeebrew/constants.dart';
import 'package:coffeebrew/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              'Register',
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
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Already have an account?'),
                              RaisedButton(
                                splashColor: Color.fromRGBO(242, 178, 2, 1),
                                elevation: 0,
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => LoginScreen(),
                                      ));
                                },
                                child: Text(
                                  'Login',
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
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
            ),
          ],
        ),
      ),
    );
  }
}
