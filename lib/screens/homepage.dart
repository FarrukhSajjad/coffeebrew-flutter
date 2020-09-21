import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeebrew/modals/brew.dart';
import 'package:coffeebrew/services/auth.dart';
import 'package:coffeebrew/widgets/brewlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brew,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          actions: [
            FlatButton.icon(
              onPressed: () async {
                await _authService.signout();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            )
          ],
          backgroundColor: Color.fromRGBO(242, 178, 2, 1),
        ),
        body: BrewList(),
      ),
    );
  }
}
