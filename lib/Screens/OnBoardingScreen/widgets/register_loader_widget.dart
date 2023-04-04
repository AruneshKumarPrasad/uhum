import '../../../Barrel/app_barrel.dart';

class RegisterLoaderWidget extends StatelessWidget {
  const RegisterLoaderWidget({
    super.key,
    required this.mediaProp,
    this.isLogin = false,
  });

  final Size mediaProp;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 12,
      ),
      height: mediaProp.height * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            isLogin ? 'Logging you In!' : "Creating your Account",
            style: const TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          Lottie.asset(
            isLogin
                ? 'assets/Login/Login.json'
                : 'assets/OnBoarding/Builder.json',
            height: mediaProp.height * 0.25,
          ),
          SizedBox(
            height: mediaProp.height * 0.02,
          ),
          const CustomLoadingWidget(),
        ],
      ),
    );
  }
}
