import '../../Barrel/app_barrel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late AnimationController _animationController;
  // late Animation<Offset> _slideAnimation;

  bool _finalGradient = false;

  void reDirector() {
    Timer(const Duration(seconds: 1), () async {
      await UserServices.instance.getUserId().then((resultUID) async {
        if (resultUID != "") {
          await UserServices.instance
              .checkIfOnBoarded(resultUID)
              .then((value) async {
            if (value) {
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
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(
          milliseconds: 500,
        ),
        height: mediaProp.height,
        width: mediaProp.width,
        decoration: BoxDecoration(
          gradient: _finalGradient
              ? GlobalColors.appThemeGradient
              : const LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.center,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              delay: const Duration(milliseconds: 500),
              onPlay: (controller) {
                setState(() {
                  _finalGradient = true;
                });
              },
              effects: const [
                FadeEffect(
                  duration: Duration(milliseconds: 500),
                ),
              ],
              child: const Text(
                "Ahum",
                style: TextStyle(
                  fontSize: 56,
                  height: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Animate(
              onComplete: (controller) {
                reDirector();
              },
              delay: const Duration(milliseconds: 500),
              effects: const [
                FadeEffect(),
                MoveEffect(
                  duration: Duration(seconds: 1),
                  begin: Offset(
                    0,
                    -20,
                  ),
                  end: Offset.zero,
                ),
              ],
              child: const Text(
                "your journey to yourself",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Background(
    //     mediaProp: mediaProp,
    //     child: [
    //       AnimatedOpacity(
    //         opacity: !_animationController.isAnimating ? 0 : 1,
    //         duration: const Duration(milliseconds: 500),
    //         child: Container(
    //           alignment: Alignment.center,
    //           child: SlideTransition(
    //             position: _slideAnimation,
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(20),
    //               child: Container(
    //                 height: mediaProp.width * 0.4,
    //                 width: mediaProp.width * 0.4,
    //                 alignment: Alignment.center,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: Colors.white.withOpacity(0.5),
    //                 ),
    //                 child: BackdropFilter(
    //                   filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Image.asset(
    //                         'assets/Home/icons/lotus.png',
    //                         color: Colors.deepPurpleAccent.shade700,
    //                         height: 100,
    //                         width: 100,
    //                       ),
    //                       Text(
    //                         'Ahum',
    //                         style: TextStyle(
    //                           fontSize: 36,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.deepPurpleAccent.shade700,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
