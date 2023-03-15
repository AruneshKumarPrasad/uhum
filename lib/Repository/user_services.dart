import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/userModel.dart';

class UserServices {
  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return {'user': null, 'error': 'Google sign-in failed.'};
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential)
          .catchError((error) async {
        if (error.code == 'credential-already-in-use') {
          final GoogleSignInAccount? googleUser =
              await GoogleSignIn().signInSilently();
          final GoogleSignInAuthentication googleAuth =
              await googleUser!.authentication;

          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          throw await FirebaseAuth.instance.signInWithCredential(credential);
        } else {
          throw error;
        }
      });

      saveUserId(userCredential.user!.uid);
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
      String profilePictureURL,
      String level,
      String currentExperience,
      String email,
      String password) async {
    try {
       await FirebaseAuth.instance
          .createUserWithEmailAndPassword
          (email: email, password: password)
          .then((value) {
        saveUser(
          firstName,
          lastName,
          profilePictureURL,
          value.user!.uid,
          level,
          currentExperience,
          email,
        ).then((value) {
          // save uId using shared preferences
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> saveUser(
    String firstName,
    String lastName,
    String profilePictureURL,
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
          profilePictureUrl: profilePictureURL,
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
    print('Firebase error: ${e.message}');
    return false;
  } catch (e) {
    // Handle other errors
    print('Error: $e');
    return false;
  }
}




}
