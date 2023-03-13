import '../../../Barrel/app_barrel.dart';
import '../../../Repository/userServices.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'or',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                      height: 45,
                      width: 45,
                      child: Image(
                          image: AssetImage('assets/OnBoarding/apple.png'))),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Sign up with Apple",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            UserServices().signInWithGoogle().then((value) => print(value['error']));
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
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                        height: 45,
                        width: 45,
                        child: Image(
                            image: AssetImage('assets/OnBoarding/google.png'))),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Sign up with Google",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                children: const [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: Image(
                      image: AssetImage('assets/OnBoarding/facebook.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Sign up with Facebook",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
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
