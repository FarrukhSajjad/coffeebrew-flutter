import 'package:coffeebrew/modals/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object
  UserModal _userFromFirebase(User user) {
    if (user != null) {
      return UserModal(userId: user.uid);
    } else {
      return null;
    }
  }

  Stream<UserModal> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //signin with email and password

  Future signinWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  //logout
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
