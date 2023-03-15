import '../../../Barrel/app_barrel.dart';

class ProfileImagePickerWidget extends StatelessWidget {
  const ProfileImagePickerWidget({
    super.key,
    required this.mediaProp,
  });

  final Size mediaProp;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingProvider>(context);
    return GestureDetector(
      onTap: () {
        if (!provider.isImageLoading) {
          provider.updateImageLoading(true);
          print('Implement Picker!');
          provider.updateImageLoading(false);
        }
      },
      child: AnimatedCrossFade(
        crossFadeState: !provider.isImageLoading && provider.photoLocation != ''
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 250),
        firstChild: Container(
          height: mediaProp.height * 0.4,
          width: mediaProp.height * 0.4,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            image: DecorationImage(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.contain,
              image: AssetImage('assets/OnBoarding/ProfilePicture.jpg'),
            ),
          ),
          child: Lottie.asset(
            'assets/OnBoarding/ClickMe.json',
            height: 150,
            width: 150,
          ),
        ),
        secondChild: Container(
          height: mediaProp.height * 0.4,
          width: mediaProp.height * 0.4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            image: DecorationImage(
              colorFilter: const ColorFilter.linearToSrgbGamma(),
              fit: BoxFit.contain,
              image: AssetImage(provider.photoLocation),
            ),
          ),
        ),
      ),
    );
  }
}
