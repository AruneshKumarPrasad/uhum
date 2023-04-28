import 'package:uhum/Barrel/app_barrel.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({
    super.key,
    required this.meditationCategory,
    required this.meditation,
  });
  static const String routeName = '/AudioPlayerScreen';

  final MeditationCategory meditationCategory;
  final Meditation meditation;

  @override
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 55,
        scrolledUnderElevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FittedBox(
              fit: BoxFit.fitHeight,
              child: Icon(
                Icons.menu,
                size: 52,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              meditation.imageUrl,
            ),
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.25),
          width: mediaProp.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: mediaProp.height * 0.1,
                width: mediaProp.width,
              ),
              Container(
                height: mediaProp.height * 0.45,
                width: mediaProp.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      meditation.imageUrl,
                    ),
                  ),
                ),
              ),
              const Text(
                "Cool Vibes",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: mediaProp.height * 0.25,
                width: mediaProp.width,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: mediaProp.height * 0.25,
        width: mediaProp.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
      ),
    );
  }
}
