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
          showDialog(
              context: context,
              builder: (conext) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //  height: mediaProp.height* 0.2,
                    width: mediaProp.width * 0.75,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Select Soruce',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //IconButton(onPressed: (){}, icon: icon)
                            ElevatedButton.icon(
                                onPressed: () {
                                  provider.getPorfileImage(true).then(
                                      (value) => Navigator.of(context).pop());
                                },
                                icon: Icon(Icons.camera),
                                label: Text('Camera')),

                            ///TextButton(onPressed: (){}, child: Text('Camera')),
                            ElevatedButton.icon(
                                onPressed: () {
                                  provider.getPorfileImage(false).then(
                                      (value) => Navigator.of(context).pop());
                                },
                                icon: Icon(Icons.photo),
                                label: Text('Gallery')),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close')),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
          provider.updateImageLoading(false);
        }
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  fit: BoxFit.contain,
                  image: AssetImage('assets/OnBoarding/ProfilePicture.jpg'),
                ),
              ),
              child: provider.isPicturePicked
                  ? null
                  : Lottie.asset(
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
              fit: BoxFit.cover,
              image: FileImage(
                File(provider.photoLocation),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
