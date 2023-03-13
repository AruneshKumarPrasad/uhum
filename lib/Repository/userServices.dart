

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices{

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

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
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
  String uId = prefs.getString('uId') ??"";
  return uId;
    }
      Future <void> saveUserId(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.setString('uId', value);

    }
    


}