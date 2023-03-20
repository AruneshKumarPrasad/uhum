import '../../Barrel/app_barrel.dart';
import '../../Models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _currentUser;
  get currentUser => _currentUser;
  void updateCurrentUser(UserModel value) {
    _currentUser = value;
    notifyListeners();
  }

  void removeCurrentUser() {
    _currentUser = null;
    notifyListeners();
  }

  Future<void> fetchAndAssignCurrentUser(String uid) async {
    _currentUser = await UserServices.instance.getUserFromFireStore(uid);
    notifyListeners();
  }
}
