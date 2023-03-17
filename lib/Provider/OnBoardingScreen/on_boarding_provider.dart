import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as p;

import '../../Barrel/app_barrel.dart';

class OnBoardingProvider with ChangeNotifier {
  final ImagePicker _profilePicturePicker = ImagePicker();

  int _tabIndex = 0;
  String _email = '';
  String _uid = '';
  String _firstName = '';
  String _lastname = '';
  String _photoLocation = '';
  String _photoURL = '';
  bool _isImageLoading = false;

  int get tabIndex => _tabIndex;
  String get email => _email;
  String get uid => _uid;
  String get firstName => _firstName;
  String get lastname => _lastname;
  String get photoLocation => _photoLocation;
  String get photoURL => _photoURL;
  bool get isImageLoading => _isImageLoading;

  void updateTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updateUID(String value) {
    _uid = value;
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

  Future<String?> uploadProfilePicture() async {
    final String fileExtension = p.extension(_photoLocation);
    final Reference ref = FirebaseStorage.instance
        .ref()
        .child('users/$_uid/profile/ProfilePicture$fileExtension');
    try {
      final UploadTask uploadTask = ref.putFile(File(_photoLocation));
      await uploadTask;
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print('Firebase Storage Error: ${error.message}');
      }
      return error.message;
    } catch (error) {
      rethrow;
    }

    try {
      final url = await ref.getDownloadURL();
      _photoURL = url;
      notifyListeners();
      await _updateProfilePicture(profilePicture: url);
    } catch (error) {
      if (kDebugMode) {
        print('Profile Upload Error: $error');
      }
      return error.toString();
    }
    return null;
  }

  Future<void> _updateProfilePicture({required String profilePicture}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_uid)
          .update({"profilePicture": profilePicture});
    } catch (error) {
      rethrow;
    }
  }
}
