import 'package:flutter/material.dart';
import 'widgets/register_login_widget.dart';

class LandingScreen extends StatefulWidget {
   LandingScreen( {Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/Splash/images/Vector.png',
                  scale: 3.5,
                ),
              ),
              Positioned(
                top: mediaProp.height * 0.3,
                left: 0,
                child: Image.asset(
                  'assets/Splash/images/Vector (1).png',
                  scale: 3,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/Splash/images/Vector (2).png',
                  scale: 3,
                ),
              ),
              Positioned(
                top: 0,
                bottom: mediaProp.height * 0.23,
                left: 0,
                right: 0,
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: const Text(
                            "Access Life Changing Programs",
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: mediaProp.height * 0.4,
                          width: double.maxFinite,
                          child: const Image(
                            image:
                                AssetImage('assets/Splash/images/bookcard.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: RegisterLoginWidget(mediaProp: mediaProp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
