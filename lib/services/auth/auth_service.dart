import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //instance auth& firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //sign in
  Future<UserCredential> singInWithEmailPassword(String email, String password) async {
    try {
      //sing user in
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

// save user info if it doesnt alerady exist

      _firestore.collection('Users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sing up
  Future<UserCredential> singUpWithEmailPassword(String email, String password) async {
    try {
      //create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // save user info in a seperate doc

      _firestore.collection('Users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sing out

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //sing in with Google

  Future<UserCredential> singInWithGoogle() async {
    // begin interactive sign in process

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth detafil from request

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credentail for user

    final userCredential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //save data in firebase

    print(gUser.id);
    print(gUser.email);
    _firestore.collection('Users').doc(gUser.id).set({
      'uid': gUser.id,
      'email': gUser.email,
    });

    //final, lets sign in

    return await FirebaseAuth.instance.signInWithCredential(userCredential);
  }

  //errors
}
