import 'dart:ui';

import '../../Barrel/app_barrel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  void reDirector() {
    Timer(const Duration(seconds: 2), () async {
      await UserServices.instance.getUserId().then((resultUID) async {
        if (resultUID != "") {
          await UserServices.instance
              .checkIfOnBoarded(resultUID)
              .then((value) async {
            if (value) {
              // TODO: Implement Fetch Fail
              await context
                  .read<UserProvider>()
                  .fetchAndAssignCurrentUser(resultUID)
                  .then((value) {
                if (value == 'error') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 1200),
                      behavior: SnackBarBehavior.floating,
                      content: Text(value!),
                    ),
                  );
                  Navigator.of(context)
                      .pushReplacementNamed(LandingScreen.routeName);
                } else {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                }
                // TODO: Implement Fetch Fail
              });
            } else {
              Navigator.of(context)
                  .pushReplacementNamed(LandingScreen.routeName);
              Navigator.of(context)
                  .pushNamed(OnBoardingScreen.routeName, arguments: resultUID);
            }
          });
        } else {
          Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
        }
      });
    });
  }

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
        reDirector();
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
        body: Background(
          mediaProp: mediaProp,
          child: [
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
            ),
          ],
        ),
      ),
    );
  }
}
