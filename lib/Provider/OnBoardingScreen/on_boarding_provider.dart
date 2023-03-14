import '../../Barrel/app_barrel.dart';

class OnBoardingProvider with ChangeNotifier {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void updateTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }
}
