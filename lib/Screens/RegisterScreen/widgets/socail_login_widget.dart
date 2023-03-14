import '../../../Barrel/app_barrel.dart';
import 'google_login_widget.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
    this.isLogin = false,
  });

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    final mediaProp = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'or',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 65,
          width: mediaProp.width * 1.2,
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
                      image: AssetImage('assets/OnBoarding/apple.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isLogin ? "Sign-In with Apple" : "Sign-Up with Apple",
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
        GoogleLoginWidget(
          mediaProp: mediaProp,
          isLogin: isLogin,
        ),
        SizedBox(
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
                      image: AssetImage('assets/OnBoarding/facebook.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isLogin
                          ? "Sign-In with Facebook"
                          : "Sign-Up with Facebook",
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '''By continuing you declare that you’ve read and agree to
                our Terms of Service & Privacy Policy''',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
