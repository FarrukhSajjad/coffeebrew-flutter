import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeebrew/modals/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    brews.forEach((element) {
      print(element.name);
      print(element.sugar);
      print(element.strength);
    });
    return Container();
  }
}
