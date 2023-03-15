import 'package:uhum/Screens/OnBoardingScreen/widgets/profile_info_textfield_widget.dart';

import '../../../Barrel/app_barrel.dart';

class ProfileInfoFragment extends StatelessWidget {
  const ProfileInfoFragment({
    super.key,
    required TextEditingController firstnameController,
    required TextEditingController lastnameController,
    required this.mediaProp,
  })  : _firstnameController = firstnameController,
        _lastnameController = lastnameController;

  final Size mediaProp;
  final TextEditingController _firstnameController;
  final TextEditingController _lastnameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Profile Information',
                  style: TextStyle(
                    color: Color(0xff4C2C72),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'First Name',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                width: mediaProp.width * 1.1,
                child: ProfileInfoTextFieldWidget(
                  controller: _firstnameController,
                  hintText: 'Your First Name here...',
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Last Name',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                width: mediaProp.width * 1.1,
                child: ProfileInfoTextFieldWidget(
                  controller: _lastnameController,
                  hintText: 'Your Last Name here...',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
