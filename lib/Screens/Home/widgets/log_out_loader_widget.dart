import '../../../Barrel/app_barrel.dart';

class LogoutLoaderWidget extends StatelessWidget {
  const LogoutLoaderWidget({
    super.key,
    required this.mediaProp,
  });

  final Size mediaProp;
  //final bool isLogin;

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
            "Signing you out",
            style: const TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          Lottie.asset(
            'assets/Login/Login.json',
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
