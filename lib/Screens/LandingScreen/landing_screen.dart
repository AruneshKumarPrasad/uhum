import 'package:uhum/Screens/LandingScreen/widgets/register_login_widget.dart';
import 'package:uhum/Screens/LandingScreen/widgets/register_page_view_widget.dart';

import '../../Barrel/app_barrel.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Background(mediaProp: mediaProp, child: [
          Positioned(
            top: 0,
            bottom: mediaProp.height * 0.23,
            left: 0,
            right: 0,
            child: LandingPageViewWidget(
              controller: _controller,
              mediaProp: mediaProp,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: RegisterLoginWidget(
              mediaProp: mediaProp,
              controller: _controller,
            ),
          ),
        ]),
      ),
    );
  }
}
