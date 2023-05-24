import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  var user1;
//Creating new instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user1 = user.user;
  }
}
