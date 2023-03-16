import '../../../Barrel/app_barrel.dart';
import '../../../Repository/user_services.dart';

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
        await UserServices.instance.signInWithGoogle().then(
          (value) async {
            print(value['error']);
            if (value['error'] == null) {
              await UserServices.instance
                  .checkIfOnBoarded(value['user'].uid)
                  .then((value) {
                if (value) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => OnBoardingProvider(),
                        child: const OnBoardingScreen(
                          userCredMap: null,
                        ),
                      ),
                    ),
                  );
                }
              });
            } else {
              print(value['error']);
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
                    value['error'],
                  ),
                ),
              );
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
