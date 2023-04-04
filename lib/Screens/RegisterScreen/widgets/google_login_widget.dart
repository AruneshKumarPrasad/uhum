import 'package:uhum/Screens/OnBoardingScreen/widgets/register_loader_widget.dart';

import '../../../Barrel/app_barrel.dart';

class GoogleLoginWidget extends StatelessWidget {
  const GoogleLoginWidget({
    super.key,
    required this.mediaProp,
    required this.isLogin,
  });

  final Size mediaProp;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
          context: context,
          builder: (context) => RegisterLoaderWidget(
            mediaProp: mediaProp,
            isLogin: true,
          ),
        );
        await UserServices.instance.signInWithGoogle().then(
          (result) async {
            if (result['error'] == null) {
              await UserServices.instance
                  .checkIfOnBoarded(result['user'].uid)
                  .then((value) async {
                if (value) {
                  await context
                      .read<UserProvider>()
                      .fetchAndAssignCurrentUser(result['user'].uid)
                      .then((value) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  });
                } else {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => OnBoardingProvider(),
                        child: OnBoardingScreen(
                          uid: result['user'].uid,
                        ),
                      ),
                    ),
                  );
                }
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  margin: EdgeInsets.only(
                    bottom: mediaProp.height - 80,
                    left: 24,
                    right: 24,
                  ),
                  padding: const EdgeInsets.all(12),
                  duration: const Duration(milliseconds: 1200),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    result['error'],
                  ),
                ),
              );
              Navigator.of(context).pop();
            }
          },
        );
      },
      child: SizedBox(
        height: 65,
        width: MediaQuery.of(context).size.width * 1.2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: null,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black, width: 2),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 45,
                  width: 45,
                  child: Image(
                    image: AssetImage('assets/OnBoarding/google.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isLogin ? "Sign-In with Google" : "Sign-Up with Google",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
