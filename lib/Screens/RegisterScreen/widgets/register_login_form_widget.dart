import 'package:uhum/Screens/RegisterScreen/widgets/register_textfield_widget.dart';

import '../../../Barrel/app_barrel.dart';

class RegisterLoginFormWidget extends StatelessWidget {
  RegisterLoginFormWidget({
    super.key,
    this.isLogin = false,
  });

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isLogin ? 'Sign-In' : 'Sign-Up',
                style: const TextStyle(
                  color: Color(0xff4C2C72),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Email',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        RegisterTextField(
          controller: _emailController,
          hintText: 'name@example.com',
          focus: _focusEmail,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        RegisterTextField(
          controller: _passwordController,
          hintText: '*******',
          focus: _focusPassword,
        ),
        SizedBox(
          height: 75,
          width: MediaQuery.of(context).size.width * 1.2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                if (isLogin) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => OnBoardingProvider(),
                        child: const OnBoardingScreen(),
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff7758F6),
                shape: const StadiumBorder(),
              ),
              child: Text(
                isLogin ? 'Login' : 'Create an account',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLogin
                    ? "Don't have an Account? "
                    : 'Already have an Account?  ',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (isLogin) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  isLogin ? "Sign-Up" : "Sign-In",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
