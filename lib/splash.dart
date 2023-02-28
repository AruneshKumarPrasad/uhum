// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/android.png"), context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/Vector.png',
            width: 250,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/images/Vector (1).png',
            width: 100,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/Vector (2).png',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          alignment: const Alignment(1, -1),
          child: Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                label: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.grey,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
              )),
        ),
        PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                Container(
                  child: Container(
                    margin: const EdgeInsets.only(top: 170, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 250,
                              child: const Text(
                                "Access Life Changing Programs",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 45),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 40),
                              width: 300,
                              child: Image.asset('assets/images/bookcard.png'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  child: Container(
                    margin: const EdgeInsets.only(top: 190, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 250,
                              child: const Text(
                                "Learn from the best",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 45),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/Card.png',
                                  width: 170,
                                ),
                                Image.asset(
                                  'assets/images/Card.png',
                                  width: 170,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  child: Container(
                    margin: const EdgeInsets.only(top: 170, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 250,
                              child: const Text(
                                "Complete sessions in your own pace",
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 45),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 40),
                              width: 300,
                              child: Image.asset(
                                'assets/images/Book Chapter & Badge.png',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 261,
                  height: 50,
                  margin: const EdgeInsets.only(top: 600),
                  child: ElevatedButton.icon(
                    icon: const Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 16,
                          height: 1.3,
                          fontWeight: FontWeight.w400),
                    ),
                    label: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Notificationallow()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 80, 163, 246),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(top: 660),
                  child: Row(
                    children: const [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('Sign In',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 24, 135, 226)))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 20),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
            ))
      ],
    ));
  }
}

class Notificationallow extends StatelessWidget {
  const Notificationallow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/Vector.png',
            width: 250,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/images/Vector (1).png',
            width: 100,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/Vector (2).png',
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              alignment: const Alignment(1, -1),
              child: Container(
                  width: 80,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    label: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.grey,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                  )),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset(
                'assets/images/android.png',
                height: 400,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: const Text(
                'We will like to send you push notifications.',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 80, 163, 246),
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    child: const Text('Allow',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 253, 253, 253),
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    child: const Text('Don\'t Allow',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    ));
  }
}
