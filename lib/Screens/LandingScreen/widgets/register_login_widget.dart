import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uhum/Screens/PermissionScreen/permission_screen.dart';

import '../../../Barrel/app_barrel.dart';

class RegisterLoginWidget extends StatelessWidget {
  const RegisterLoginWidget({
    super.key,
    required this.mediaProp,
    required this.controller,
  });

  final Size mediaProp;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaProp.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: mediaProp.height * 0.06,
            width: mediaProp.width * 0.5,
            child: ElevatedButton.icon(
              icon: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.3,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              label: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PermissionScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 163, 246),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 24, 135, 226),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 20),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
            ),
          )
        ],
      ),
    );
  }
}
