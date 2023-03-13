import 'package:flutter/material.dart';

import '../OnBoardingScreen/OnBoardingScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff7758F6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xffE4E2E6),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                '1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff8A888C),
                                    fontFamily: 'Poppins'),
                              ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xffE4E2E6),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                '2',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff8A888C),
                                    fontFamily: 'Poppins'),
                              ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xffE4E2E6),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                '3',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff8A888C),
                                    fontFamily: 'Poppins'),
                              ))),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Sign up',
                            style: TextStyle(
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: _emailController,
                          obscureText: false,
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                            ),
                            // labelText: 'Email',
                            hintText: 'name@example.com',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                        width: MediaQuery.of(context).size.width * 1.2,

                      child: TextField(
                        controller: _passwordController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                          // labelText: 'Email',
                          hintText: '***********',
                        
                      ),
                              
                        ),
                    ),
                    SizedBox(
                      height: 75,
                      width: MediaQuery.of(context).size.width * 1.2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const OnBoardingScreen(),
                              ),
                            )
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7758F6),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            'Create an account',
                            style: TextStyle(
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
                        children: const [
                          Text(
                            'Already have an account?Sign in',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'or',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      width: MediaQuery.of(context).size.width * 1.2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: null,
                          style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(
                                  height: 45,
                                  width: 45,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/OnBoarding/apple.png'))),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Sign up with Apple",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      width: MediaQuery.of(context).size.width * 1.2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: null,
                          style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(
                                  height: 45,
                                  width: 45,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/OnBoarding/google.png'))),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Sign up with Google",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 65,
                      width: MediaQuery.of(context).size.width * 1.2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: null,
                          style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(
                                  height: 45,
                                  width: 45,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/OnBoarding/facebook.png'))),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Sign up with Facebook",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '''By continuing you declare that you’ve read and agree to
                            our Terms of Service & Privacy Policy''',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
