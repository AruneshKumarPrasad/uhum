import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uhum/Screens/LandingScreen/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.1),
      end: const Offset(0, 0),
    ).animate(_animationController);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingScreen(),
            ),
          );
        });
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
              AnimatedOpacity(
                opacity: !_animationController.isAnimating ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  alignment: Alignment.center,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: mediaProp.width * 0.4,
                        width: mediaProp.width * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/Home/icons/lotus.png',
                                color: Colors.deepPurpleAccent.shade700,
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                'Ahum',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurpleAccent.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
