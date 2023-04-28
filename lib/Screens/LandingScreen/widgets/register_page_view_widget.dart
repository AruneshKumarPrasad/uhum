import '../../../Barrel/app_barrel.dart';

class LandingPageViewWidget extends StatelessWidget {
  const LandingPageViewWidget({
    super.key,
    required PageController controller,
    required this.mediaProp,
  }) : _controller = controller;

  final PageController _controller;
  final Size mediaProp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  "Access Life Changing Programs",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: mediaProp.height * 0.4,
                width: double.maxFinite,
                child: const Image(
                  image: AssetImage('assets/Splash/images/bookcard.png'),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  "Access Life Changing Programs",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: mediaProp.height * 0.4,
                width: double.maxFinite,
                child: const Image(
                  image: AssetImage('assets/Splash/images/bookcard.png'),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  "Access Life Changing Programs",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: mediaProp.height * 0.4,
                width: double.maxFinite,
                child: const Image(
                  image: AssetImage('assets/Splash/images/bookcard.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
