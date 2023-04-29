import 'display_card_widget.dart';
import '../../../../../Barrel/app_barrel.dart';

class DisplayTrackWidget extends StatelessWidget {
  const DisplayTrackWidget({
    super.key,
    required this.meditationServices,
    required this.meditation,
  });

  final MeditationServices meditationServices;
  final Meditation meditation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // String? url = await meditationServices.getFileUrl('EmptyMind.mp3');
        // print(url);

        // await meditationServices
        //     .addMeditationTrackToRecommended(
        //   meditation: meditation,
        // );

        Navigator.of(context).pushNamed(
          AudioPlayerScreen.routeName,
          arguments: meditation,
        );
      },
      child: DisplayCardWidget(
        slectedColor: Colors.black54,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(meditation.imageUrl),
            ),
          ),
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Text(
              meditation.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
