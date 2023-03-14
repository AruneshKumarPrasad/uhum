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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Profile info',
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
                'First Name',
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
            width: mediaProp.width * 1.1,
            child: TextField(
              controller: _firstnameController,
              obscureText: false,
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                hintText: 'John',
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
                'Last Name',
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
            width: mediaProp.width * 1.1,
            child: TextField(
              controller: _lastnameController,
              obscureText: false,
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                hintText: 'Doe',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
