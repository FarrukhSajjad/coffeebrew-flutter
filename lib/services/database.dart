import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeebrew/modals/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugar': sugar,
      'name': name,
      'strength': strength,
    });
  }

  List<Brew> brewList(QuerySnapshot snapshot) {
    return snapshot.docs.map((docs) {
      return Brew(
        name: docs.data()['name'] ?? "",
        strength: docs.data()["strength"] ?? 0,
        sugar: docs.data()["sugar"] ?? "0",
      );
    }).toList();
  }

  Stream<List<Brew>> get brew {
    return brewCollection.snapshots().map(brewList);
  }
}
