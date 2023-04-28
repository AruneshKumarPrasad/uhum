import 'package:flutter_svg/flutter_svg.dart';
import 'package:uhum/Screens/Home/widgets/log_out_loader_widget.dart';

import '../../../Barrel/app_barrel.dart';

class StartDrawerWidget extends StatelessWidget {
  const StartDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: SvgPicture.asset(
                    'assets/Logo/Logo.svg',
                    width: 100,
                    height: 100,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahum',
                      style: TextStyle(
                        color: Colors.blueGrey.shade700,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'your journey to yourself',
                        style: TextStyle(
                          color: Colors.blueGrey.shade700,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Log-out'),
            onTap: () async {
              showModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) {
                    return LogoutLoaderWidget(mediaProp: mediaProp);
                  });
              await Future.delayed(const Duration(seconds: 2));
              await UserServices.instance.signOut().then(
                    (value) => Navigator.of(context).pushReplacementNamed(
                      LandingScreen.routeName,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
