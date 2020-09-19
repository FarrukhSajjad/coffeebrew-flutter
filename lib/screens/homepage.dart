import 'package:coffeebrew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
