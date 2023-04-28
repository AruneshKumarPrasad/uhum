import 'package:uhum/Screens/Home/widgets/start_drawer_widget.dart';

import '../../Barrel/app_barrel.dart';
import 'Fragments/HomePage/home_page_fragment.dart';
import 'Fragments/MeditaionPage/meditation_page_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentPageIndex = 0;

  onPageChange(int index) {
    setState(() {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
      );
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaProp = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const StartDrawerWidget(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePageFragment(
            mediaProp: mediaProp,
            scaffoldKey: _scaffoldKey,
          ),
          MeditationPageFragment(mediaProp: mediaProp),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          onPageChange(index);
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.house_rounded),
            icon: Icon(Icons.house_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite_rounded),
            icon: Icon(
              Icons.favorite_outline_rounded,
            ),
            label: 'Meditation',
          ),
          // NavigationDestination(
          //   selectedIcon: Icon(Icons.bookmark),
          //   icon: Icon(Icons.bookmark_border),
          //   label: 'Journal',
          // ),
          // NavigationDestination(
          //   selectedIcon: Icon(Icons.person_2_rounded),
          //   icon: Icon(Icons.person_2_outlined),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
