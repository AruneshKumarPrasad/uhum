import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user_model.dart';

class UserServices {
  static final UserServices instance = UserServices._internal();

  UserServices._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

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
          await _auth.signInWithCredential(credential);

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

  Future<void> _removeUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uId');
  }

  Future<Map<String, dynamic>> createEmailAccount(
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final String uID = _auth.currentUser!.uid;
      _saveUserId(uID);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uID)
          .set({'onBoarded': false});
      return {'user': _auth.currentUser, 'error': null};
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
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final String uID = _auth.currentUser!.uid;
      _saveUserId(uID);
      return {'user': _auth.currentUser, 'error': null};
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
      var toUpload = userModel.toMap();
      toUpload.addEntries({'onBoarded': true}.entries);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .update(toUpload);
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

  Future<UserModel?> getUserFromFireStore(String uid) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (!userDoc.exists) {
        return null;
      }

      final UserModel userModel = UserModel.fromMap(userDoc.data()!);
      return userModel;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
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

  Future<void> signOut() async {
    // Remove the Firebase user's uid
    _removeUserId(_auth.currentUser!.uid);

    // Sign out the Firebase user
    await _auth.signOut();

    // Sign out the Google user (if logged in with Google)
    final GoogleSignInAccount? googleUser =
        await _googleSignIn.signInSilently();
    if (googleUser != null) {
      await _googleSignIn.disconnect();
    }
  }
}
