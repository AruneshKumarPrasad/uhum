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
        // if (!provider.isImageLoading) {
        //   provider.updateImageLoading(true);
        //   print('Implement Picker!');
        //   provider.updateImageLoading(false);
        // }
        provider.getPorfileImage();
      },
      child: AnimatedCrossFade(
        crossFadeState: !provider.isImageLoading && provider.photoLocation != ''
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 250),
        firstChild: CircleAvatar(
       radius: 100,
          child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),

            child: Container(
          
              // height: mediaProp.height * 0.4,
              // width: mediaProp.height * 0.4,
              alignment: Alignment.center,
              decoration:  BoxDecoration(
          
                borderRadius: BorderRadius.circular(20),
                image:
                
                 DecorationImage(
                  
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  fit: BoxFit.contain,
                  image:  provider.isPicturePicked? 
                FileImage(File(provider.croppedFile!
                                            .path)) as ImageProvider
                                            
                                            : AssetImage('assets/OnBoarding/ProfilePicture.jpg'),
                ),
              ),
              child: provider.isPicturePicked? null: Lottie.asset(
                'assets/OnBoarding/ClickMe.json',
                height: 150,
                width: 150,
              ),
            ),
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
