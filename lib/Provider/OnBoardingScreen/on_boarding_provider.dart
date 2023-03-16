import 'package:image_cropper/image_cropper.dart';

import '../../Barrel/app_barrel.dart';

class OnBoardingProvider with ChangeNotifier {
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

  // handling userProfilePicture

  //######################  Profile Picture Picking   #################33

  final ImagePicker _profilePicturepicker = ImagePicker();
  File? profilePicture;
  bool isPicturePicked = false;
  CroppedFile? croppedFile;

  Future<void> getPorfileImage(bool isCamera) async {
    final pickedFile = await _profilePicturepicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 200.0,
        maxHeight: 300.0);
    if (pickedFile != null) {
      profilePicture = File(pickedFile.path);
      // uploadprofilePicture();
      croppedFile = await ImageCropper().cropImage(
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          sourcePath: profilePicture!.path,
          cropStyle: CropStyle.circle);
      _photoLocation = croppedFile!.path;
      // isPicturePicked = true;
      notifyListeners();
    } else {
      print('No Image Selected');
    }
  }

  // ########## uploading the selected picture to fireStorage #######

  void uploadprofilePicture() {
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profilePicture!.path).pathSegments.last}')
        .putFile(File(profilePicture!.path))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        //      getUserData();
        updateprofilePicture(
          profilePicture: value,
        );
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

  // ######### updating the PoriflePicture field in users Collection for respective user ############
  void updateprofilePicture({required String profilePicture}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc('uId')
        .update({"profilePicture": profilePicture}).then((value) {
      //getUserData();
    }).catchError((error) {
      print(error.toString());
    });
  }
}
