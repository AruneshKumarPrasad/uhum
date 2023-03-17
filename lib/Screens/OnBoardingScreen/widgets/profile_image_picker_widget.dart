import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../Barrel/app_barrel.dart';
import '../../GlobalWidgets/image_selector_widget.dart';

class ProfileImagePickerWidget extends StatelessWidget {
  const ProfileImagePickerWidget({
    super.key,
    required this.mediaProp,
  });

  final Size mediaProp;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingProvider>(context);
    return AnimatedCrossFade(
      crossFadeState: provider.isImageLoading
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 250),
      firstChild: GestureDetector(
        onTap: () {
          if (!provider.isImageLoading) {
            provider.updateImageLoading(true);
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return ImageSelectorWidget(
                    mediaProp: mediaProp,
                    provider: provider,
                  );
                }).then(
              (value) => provider.updateImageLoading(false),
            );
          }
        },
        child: AnimatedCrossFade(
          crossFadeState:
              !provider.isImageLoading && provider.photoLocation != ''
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 250),
          firstChild: Container(
            height: mediaProp.width * 0.7,
            width: mediaProp.width * 0.7,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                colorFilter: ColorFilter.linearToSrgbGamma(),
                fit: BoxFit.contain,
                image: AssetImage('assets/OnBoarding/ProfilePicture.jpg'),
              ),
            ),
            child: provider.photoLocation != ''
                ? null
                : Lottie.asset(
                    'assets/OnBoarding/ClickMe.json',
                    height: 150,
                    width: 150,
                  ),
          ),
          secondChild: Container(
            height: mediaProp.width * 0.7,
            width: mediaProp.width * 0.7,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                colorFilter: const ColorFilter.linearToSrgbGamma(),
                fit: BoxFit.cover,
                image: FileImage(
                  File(provider.photoLocation),
                ),
              ),
            ),
          ),
        ),
      ),
      secondChild: Container(
        height: mediaProp.width * 0.7,
        width: mediaProp.width * 0.7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: SpinKitFoldingCube(
          size: 40,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven
                    ? Colors.deepPurpleAccent.shade100.withOpacity(0.5)
                    : Colors.deepPurpleAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
