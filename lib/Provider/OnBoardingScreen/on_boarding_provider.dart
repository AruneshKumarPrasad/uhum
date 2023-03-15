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
}
