import 'package:coffeebrew/modals/user.dart';
import 'package:coffeebrew/screens/authenticate/authenticate.dart';
import 'package:coffeebrew/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModal>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
