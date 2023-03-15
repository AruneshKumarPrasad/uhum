import '../Barrel/app_barrel.dart';

class UserActions {
  // Profile Image Modification
  final ImagePicker _profileImagepicker = ImagePicker();
  File? profileImage;
  bool isPimageLoaded = false;

  Future<void> getPorfileImage() async {
    final pickedFile = await _profileImagepicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      //  loadedProfileImage =  File(profileImage.path);
      //  print(pickedFile.path);
      uploadProfileImage();
      isPimageLoaded = true;
    } else {
      print('No Image Selected');
    }
  }

  void uploadProfileImage() {
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(File(profileImage!.path))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        //      getUserData();
        // updateProfileImage(profileImage: value);
      }).catchError((error) {
        print('my error is: ');

        print(error.toString());
      });
    }).catchError((error) {
      print('error is: ');
      print(error.toString());
      // print(error.toString());
    });
  }

  void updateProfileImage({required String profileImage, required String uId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update({"image": profileImage}).then((value) {
      //getUserData();
    }).catchError((error) {
      print(error.toString());
    });
  }
}
