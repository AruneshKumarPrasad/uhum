import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../Barrel/app_barrel.dart';

class OnBoardingProvider with ChangeNotifier {
  final ImagePicker _profilePicturePicker = ImagePicker();

  int _tabIndex = 0;
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _lastname = '';
  String _photoLocation = '';
  bool _isImageLoading = false;
  bool _isDone = false;

  int get tabIndex => _tabIndex;
  String get email => _email;
  String get password => _password;
  String get firstName => _firstName;
  String get lastname => _lastname;
  String get photoLocation => _photoLocation;
  bool get isImageLoading => _isImageLoading;
  bool get isDone => _isDone;

  void updateTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  void updateFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  void updateLastName(String value) {
    _lastname = value;
    notifyListeners();
  }

  void updatePhotoLocation(String value) {
    _photoLocation = value;
    notifyListeners();
  }

  void updateImageLoading(bool value) {
    _isImageLoading = value;
    notifyListeners();
  }

  void updateDone(bool value) {
    _isDone = value;
    notifyListeners();
  }

  Future<String?> getProfileImage(bool isCamera) async {
    try {
      final pickedFile = await _profilePicturePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (pickedFile != null) {
        final croppedFile = await ImageCropper().cropImage(
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          sourcePath: pickedFile.path,
          compressQuality: 100,
        );
        if (croppedFile != null) {
          _photoLocation = croppedFile.path;
          notifyListeners();
          return null;
        } else {
          return 'Image not cropped';
        }
      } else {
        if (kDebugMode) {
          print('No Image Selected');
        }
        return 'No Image Selected';
      }
    } on PlatformException catch (e) {
      return e.message;
    }
  }

  void uploadProfilePicture() {
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(_photoLocation).pathSegments.last}')
        .putFile(File(_photoLocation))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateProfilePicture(
          profilePicture: value,
        );
      }).catchError((error) {
        if (kDebugMode) {
          print('Profile Upload Error: ');
        }

        if (kDebugMode) {
          print(error.toString());
        }
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Upload Error is: ');
        print(error.toString());
      }
    });
  }

  void updateProfilePicture({required String profilePicture}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc('uId')
        .update({"profilePicture": profilePicture}).then((value) {
      //getUserData();
    }).catchError((error) {
      if (kDebugMode) {
        print('Update Error is: ');
        print(error.toString());
      }
    });
  }
}
