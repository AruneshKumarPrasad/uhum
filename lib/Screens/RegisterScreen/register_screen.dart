import 'package:flutter/material.dart';
import 'package:uhum/Screens/RegisterScreen/widgets/register_form_widget.dart';
import 'package:uhum/Screens/RegisterScreen/widgets/socail_login_widget.dart';

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
        appBar: AppBar(
          toolbarHeight: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xff7758F6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: RegisterFormWidget(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: SocialLoginWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
