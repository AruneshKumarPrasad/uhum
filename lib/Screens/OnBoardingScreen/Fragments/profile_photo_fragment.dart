import '../../../Barrel/app_barrel.dart';
import '../widgets/profile_image_picker_widget.dart';

class ProfilePhotoFragment extends StatelessWidget {
  const ProfilePhotoFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaProp = MediaQuery.of(context).size;
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
                  'Profile Picture',
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
                  'Select a Picture for your Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                alignment: Alignment.center,
                height: mediaProp.height * 0.5,
                child: ProfileImagePickerWidget(mediaProp: mediaProp),
              ),
            ],
          ),
        )
      ],
    );
  }
}
