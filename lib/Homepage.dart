// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uhum/Discover.dart';

class Main_page_view extends StatefulWidget {
  const Main_page_view({super.key});

  @override
  State<Main_page_view> createState() => _Main_page_viewState();
}

class _Main_page_viewState extends State<Main_page_view> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        selectedItemColor: Colors.grey[800],
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[400],
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Home/icons/lotus.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 1000), curve: Curves.easeIn);
        },
      ),
      drawer: Drawer(),
      body: PageView(
        controller: _pageController,
        children: [Homepage(), Discover()],
        onPageChanged: (index) {
          onPageChange(index);
        },
      ),
    );
  }

  onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int counter = 0;

  final List<String> images1 = <String>[
    'assets/Home/images1/UHUM_kids.jpeg',
    'assets/Home/images1/flower.png',
    'assets/Home/images1/flower.png',
    'assets/Home/images1/flower.png',
    'assets/Home/images1/flower.png',
  ];
  final List<String> images2 = <String>[
    'assets/Home/images2/man.jpeg',
    'assets/Home/images2/leave.jpeg',
  ];
  final List<String> images3 = <String>[
    'assets/Home/images3/flowers.jpeg',
    'assets/Home/images3/green.jpeg',
  ];
  final List<String> titles1 = <String>[
    'UHUM kids',
    'Meditation',
    'Daily reflection',
    'Fitness and health',
    'Holistic wellbeing'
  ];
  final List<String> subtitles1 = <String>[
    'Brief description about live sessions',
    '',
  ];
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  final _scrollController = ScrollController();

  var category = [
    'Fitness and health',
    'Upgrade your life',
    'Daily reflection',
    'Meditation',
    'UHUM kids',
    'Holistic wellbeing'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: false,
              expandedHeight: 200,
              floating: false,
              pinned: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(144),
                child: Container(),
              ),
              snap: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  child: Image.asset(
                    'assets/Home/images/appbar_image.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Keep seeking whatever',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'matters to you',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(55, 25),
                                    backgroundColor: Colors.grey[300],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                  child: Text(
                                    'Read more',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  onPressed: () {
                                    HapticFeedback.lightImpact();
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                // Using Stack to show Notification Badge
                Stack(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.notifications_none_rounded,
                        ),
                        onPressed: () {
                          setState(() {
                            counter = 0;
                          });
                        }),
                    counter != 0
                        ? Positioned(
                            right: 11,
                            top: 11,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 14,
                                minHeight: 14,
                              ),
                              child: Text(
                                '$counter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
              ],
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 300,
                        height: 20,
                        child: Text(
                          'Goodmorning, Mahesh',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 150.0,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: titles1.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                              onTap: () {
                                print(titles1[index]);
                              },
                              child: Container(
                                width: 200,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(images1[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        titles1[index],
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[100]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26, blurRadius: 4),
                                    ],
                                  ),
                                  child: Text(
                                    category[i],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Recommended',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                      ),
                      SizedBox(
                        height: 120.0,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: images2.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            color: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(0),
                                width: 200,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(images2[index]),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Popular',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                      ),
                      SizedBox(
                        height: 130.0,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: images3.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            color: Colors.grey[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(0),
                                width: 200,
                                height: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(images3[index]),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ))
          ],
        ),
      ),
    );
  }
}
