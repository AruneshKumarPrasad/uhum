import '../../Barrel/app_barrel.dart';
import 'Fragments/profile_info_fragment.dart';
import 'Fragments/profile_photo_fragment.dart';
import 'widgets/nav_bar_widget.dart';
import 'widgets/tab_label_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({
    super.key,
    required this.userCredMap,
  });

  final Map<String, String>? userCredMap;

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  late TabController _tabController;

  void _scrollToNextTab() {
    if (_tabController.index < 2) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    Future.delayed(const Duration(milliseconds: 0)).then((value) {
      final provider = Provider.of<OnBoardingProvider>(context, listen: false);
      if (widget.userCredMap != null) {
        provider.updateEmail(widget.userCredMap!['email']!);
        provider.updatePassword(widget.userCredMap!['password']!);
      }
      if (provider.firstName != '' && provider.lastname != '') {
        _firstnameController.text = provider.firstName;
        _lastnameController.text = provider.lastname;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;
    final provider = Provider.of<OnBoardingProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          tabController: _tabController,
          provider: provider,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileInfoFragment(
                    mediaProp: mediaProp,
                    firstnameController: _firstnameController,
                    lastnameController: _lastnameController,
                  ),
                  const ProfilePhotoFragment(),
                  const Center(
                    child: TabLabelWidget(
                      label: '3',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75,
              width: mediaProp.width * 1.2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_tabController.index == 0 &&
                        (_firstnameController.text.trim().length >= 2 &&
                            _lastnameController.text.trim().length >= 2)) {
                      provider
                          .updateFirstName(_firstnameController.text.trim());
                      provider.updateLastName(_lastnameController.text.trim());
                      FocusScope.of(context).unfocus();
                      Future.delayed(const Duration(milliseconds: 250))
                          .then((value) => _scrollToNextTab());
                      provider.updateTabIndex(_tabController.index);
                    } else if (_tabController.index == 0 &&
                        (_firstnameController.text.trim().length < 2 ||
                            _lastnameController.text.trim().length < 2)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 1200),
                          behavior: SnackBarBehavior.floating,
                          content:
                              Text('Names must be at least 2 characters long!'),
                        ),
                      );
                    } else {
                      _scrollToNextTab();
                      provider.updateTabIndex(_tabController.index);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7758F6),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    provider.tabIndex == 2 ? 'Done' : 'Continue',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
