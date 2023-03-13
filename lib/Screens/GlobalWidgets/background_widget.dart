import '../../Barrel/app_barrel.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.mediaProp, required this.child})
      : super(key: key);

  final Size mediaProp;
  final List<Widget> child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/Splash/images/Vector.png',
              scale: 3.5,
            ),
          ),
          Positioned(
            top: mediaProp.height * 0.3,
            left: 0,
            child: Image.asset(
              'assets/Splash/images/Vector (1).png',
              scale: 3,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/Splash/images/Vector (2).png',
              scale: 3,
            ),
          ),
          ...child,
        ],
      ),
    );
  }
}
