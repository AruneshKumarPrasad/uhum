import '../../Barrel/app_barrel.dart';
import '../../Discover.dart';
import 'Fragments/home_page_fragment.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  PageController _pageController = PageController();

  onPageChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaProp = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        body: PageView(
          controller: _pageController,
          children: [
            HomePageFragment(mediaProp: mediaProp),
            Discover(),
          ],
          onPageChanged: (index) {
            onPageChange(index);
          },
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            _pageController.animateToPage(index,
                duration: Duration(microseconds: 1000), curve: Curves.easeIn);
          },
          selectedIndex: currentPageIndex,
          destinations: [
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
            //   selectedIcon: Icon(Icons.favorite_rounded),
            //   icon: Icon(
            //     Icons.favorite_outline_rounded,
            //   ),
            //   label: 'Meditation',
            // ),
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
      ),
    );
  }
}
