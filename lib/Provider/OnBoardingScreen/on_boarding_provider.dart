import '../../Barrel/app_barrel.dart';

class OnBoardingProvider with ChangeNotifier {
  int _tabIndex = 0;
  String _email = '';
  String _password = '';
  String _firstName = '';
  String _lastname = '';

  int get tabIndex => _tabIndex;
  String get email => _email;
  String get password => _password;
  String get firstName => _firstName;
  String get lastname => _lastname;

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
    _password = value;
    notifyListeners();
  }

  void updateLastName(String value) {
    _password = value;
    notifyListeners();
  }
}
