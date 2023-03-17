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

      final String uID = userCredential.user!.uid;
      _saveUserId(uID);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uID)
          .get()
          .then((value) async {
        if (!value.exists) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(uID)
              .set({'onBoarded': false});
        }
      });
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

  Future<void> _saveUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uId', value);
  }

  Future<Map<String, dynamic>> createEmailAccount(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final String uID = FirebaseAuth.instance.currentUser!.uid;
      _saveUserId(uID);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uID)
          .set({'onBoarded': false});
      return {'user': FirebaseAuth.instance.currentUser, 'error': null};
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
      return {'user': null, 'error': e.message};
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return {'user': null, 'error': e.message};
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return {'user': null, 'error': e};
    }
  }

  Future<Map<String, dynamic>> loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final String uID = FirebaseAuth.instance.currentUser!.uid;
      _saveUserId(uID);
      return {'user': FirebaseAuth.instance.currentUser, 'error': null};
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Invalid email or password.');
        }
      }
      return {'user': null, 'error': e.message};
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return {'user': null, 'error': e};
    }
  }

  Future<String?> saveUserToFireStore({
    required String firstName,
    required String lastName,
    required String profilePicture,
    required String uId,
    required String email,
  }) async {
    try {
      UserModel userModel = UserModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        profilePicture: profilePicture,
        level: '1',
        currentExperience: '0',
        uId: uId,
      );
      // create a new document with the username as the document ID
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update(userModel.toMap());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e.toString();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e.toString();
    }
    return null;
  }

  Future<bool> checkIfOnBoarded(String uid) async {
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        final result = userDoc.data()!['onBoarded'] as bool;
        return result;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
