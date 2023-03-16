import '../../../Barrel/app_barrel.dart';
import '../../../Repository/user_services.dart';
import 'register_textfield_widget.dart';

class RegisterLoginFormWidget extends StatelessWidget {
  RegisterLoginFormWidget({
    super.key,
    this.isLogin = false,
  });

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter an email address';
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      return null;
    }

    String? validatePassword(String value) {
      if (value.isEmpty) {
        return 'Password is required';
      }
      if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      }
      if (value.length > 28) {
        return 'Password must be at most 28 characters long';
      }
      if (value.contains(' ')) {
        return 'Password cannot contain spaces';
      }
      if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{8,28}$').hasMatch(value)) {
        return 'Password must have at least one capital letter and one number';
      }
      return null;
    }

    bool formValidate() {
      if (_formKey.currentState!.validate()) {
        return true;
      } else {
        return false;
      }
    }

    return Form(
      key: _formKey,
      child: Column(
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
            validator: validateEmail,
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
            validator: validatePassword,
          ),
          SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width * 1.2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () async {
               
                  if (formValidate()) {
                    if (isLogin) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ),
                      );
                    } else {
                      await UserServices.instance
                          .checkIfAccountExists(
                        _emailController.text.trim().toLowerCase(),
                      )
                          .then((value) {
                        if (value) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => OnBoardingProvider(),
                                child: OnBoardingScreen(
                                  userCredMap: {
                                    'email': _emailController.text
                                        .trim()
                                        .toLowerCase(),
                                    'password': _passwordController.text,
                                  },
                                ),
                              ),
                            ),
                          );
                        } else {}
                      });
                    }
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
      ),
    );
  }
}
