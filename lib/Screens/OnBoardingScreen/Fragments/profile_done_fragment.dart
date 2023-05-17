import '../../../Barrel/app_barrel.dart';

class ProfileDoneFragment extends StatelessWidget {
  const ProfileDoneFragment({
    super.key,
    required this.mediaProp,
  });

  final Size mediaProp;

  @override
  Widget build(BuildContext context) {
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
                  'Finalize Changes',
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
                child: Text(
                  'It seems that you are Done?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              Container(
                height: mediaProp.height * 0.5,
                alignment: Alignment.center,
                child: Lottie.asset('assets/OnBoarding/Done.json'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
