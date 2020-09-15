import 'package:coffeebrew/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Brew',
      theme: ThemeData(),
      home: FutureBuilder(
        future: initializeFireApp(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            return Wrapper();
          } else if (snap.connectionState == ConnectionState.none) {
            return Text("No data");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future initializeFireApp() async {
    return await Firebase.initializeApp();
  }
}
