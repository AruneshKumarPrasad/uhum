import '../../Barrel/app_barrel.dart';

class ImageSelectorWidget extends StatelessWidget {
  const ImageSelectorWidget({
    super.key,
    required this.mediaProp,
    required this.provider,
  });

  final Size mediaProp;
  final OnBoardingProvider provider;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: mediaProp.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: const [
                  Text(
                    'Select Source',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SourceButtonWidget(
                    mediaProp: mediaProp,
                    isCamera: true,
                    performAction: () {
                      provider.getProfileImage(true).then(
                        (value) {
                          Navigator.of(context).pop();
                          if (value != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(value),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  SourceButtonWidget(
                    mediaProp: mediaProp,
                    isCamera: false,
                    performAction: () {
                      provider.getProfileImage(false).then(
                        (value) {
                          Navigator.of(context).pop();
                          if (value != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(value),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 2,
              ),
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent.shade400,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
