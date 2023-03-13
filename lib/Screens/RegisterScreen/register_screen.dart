import 'package:uhum/Screens/PermissionScreen/permission_screen.dart';

import '../../Barrel/app_barrel.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PermissionScreen(),
                ),
              );
            },
            child: const Text("Register"),
          ),
        ),
      ),
    );
  }
}
