import 'package:lottie/lottie.dart';

import '../../../Barrel/app_barrel.dart';

class ProfilePhotoFragment extends StatelessWidget {
  const ProfilePhotoFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaProp = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Profile Picture',
                  style: TextStyle(
                    color: Color(0xff4C2C72),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Select a Picture for your Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                alignment: Alignment.center,
                height: mediaProp.height * 0.6,
                child: Container(
                  height: mediaProp.height * 0.4,
                  width: mediaProp.height * 0.4,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    image: DecorationImage(
                      colorFilter: ColorFilter.linearToSrgbGamma(),
                      fit: BoxFit.contain,
                      image: AssetImage('assets/OnBoarding/ProfilePicture.jpg'),
                    ),
                  ),
                  child: Lottie.asset(
                    'assets/OnBoarding/ClickMe.json',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
