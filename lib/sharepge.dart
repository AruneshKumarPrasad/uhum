// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace
import 'package:flutter/material.dart';

// ignore: camel_case_types
class sharepge extends StatefulWidget {
  const sharepge({super.key});
  @override
  State<sharepge> createState() => _sharepgeState();
}

// ignore: camel_case_types
class _sharepgeState extends State<sharepge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            pinned: true,
            snap: false,
            floating: false,
            flexibleSpace: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
                child: FlexibleSpaceBar(
                    titlePadding: const EdgeInsetsDirectional.only(
                        start: 45.0, end: 15, bottom: 50.0),
                    title: const Text('keep seeking whatever matters to you'),
                    collapseMode: CollapseMode.parallax,
                    background: Image.asset(
                      'assets/Sharepage/images/bgpic.jpeg',
                      fit: BoxFit.cover,
                    ))),
            expandedHeight: 270,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: const Icon(Icons.close, color: Colors.black),
            actions: const [
              Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 35, right: 35, top: 30),
                  child: Text(
                      'Independence the way we understand it is about not being dependent on someone for money & other needs.\n\nBut there is NEVER total independence.\n\nBecause we are dependent on other people for several things for survival, they might not give you money but they need to create & provide things which you can buy from your money. So materialistically speaking, there is no such thing as complete independence.\n\nBut yes there can be mental, emotional, psychological independence. Living with such independence means NOT having belief systems & patterns which are adopted from others. Right now more than 90% of your mindset isnt yours, it is adopted. Including your habits, your ways of walking, laughing, talking, everything!\n\nBut when you are free from such blind adoption, when you do everything with your own Then that is the beginning of independence.',
                      style: TextStyle(fontSize: 18.5)),
                ),
                const SizedBox(height: 5),
                Container(
                    height: 50,
                    width: 416,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          const Icon(Icons.share, color: Colors.black),
                          const Text('Share',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
