import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/userModel.dart';

class UserServices {
  static final UserServices instance = UserServices._internal();

  UserServices._internal();

  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return {'user': null, 'error': 'Google sign-in failed.'};
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Refresh the ID token to prevent the "stale" error
      final User user = userCredential.user!;
      await user.getIdTokenResult(true);

      saveUserId(user.uid);
      return {'user': userCredential.user, 'error': null};
    } on FirebaseAuthException catch (e) {
      return {'user': null, 'error': e.message};
    } catch (e) {
      return {'user': null, 'error': e.toString()};
    }
  }

  Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uId = prefs.getString('uId') ?? "";
    return uId;
  }

  Future<void> saveUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uId', value);
  }

  Future<void> createAccount(
      String firstName,
      String lastName,
      String profilePicture,
      String level,
      String currentExperience,
      String email,
      String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        saveUser(
          firstName,
          lastName,
          profilePicture,
          value.user!.uid,
          level,
          currentExperience,
          email,
        ).then((value) async {
          // await saveUserId(value.user!.uid);
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> saveUser(
    String firstName,
    String lastName,
    String profilePicture,
    String uId,
    String level,
    String currentExperience,
    String email,
  ) async {
    try {
      UserModel userModel = UserModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          profilePicture: profilePicture,
          level: level,
          currentExperience: currentExperience,
          uId: uId);
      // create a new document with the username as the document ID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(userModel.toMap());
    } on FirebaseException catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> checkIfOnBoarded(String uid) async {
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return userDoc.exists;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkIfAccountExists(String email) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } on FirebaseException catch (e) {
      // Handle the Firebase error
      if (kDebugMode) {
        print('Firebase error: ${e.message}');
      }
      return false;
    } catch (e) {
      // Handle other errors
      if (kDebugMode) {
        print('Error: $e');
      }
      return false;
    }
  }
}
