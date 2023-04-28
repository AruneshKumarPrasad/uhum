import '../../../../../Barrel/app_barrel.dart';
import 'display_track_widget.dart';

class ShowRecommendedTrackWidget extends StatelessWidget {
  const ShowRecommendedTrackWidget({
    super.key,
    required this.meditationServices,
  });

  final MeditationServices meditationServices;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recommended Music",
          style: TextStyle(
            fontSize: 20,
            height: 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Plug in and let yourself relax in utopia",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FutureBuilder(
          future: meditationServices.getMeditationRecommndation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Meditation> meditationsList = snapshot.data!;
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 24,
                ),
                shrinkWrap: true,
                itemCount: meditationsList.length,
                itemBuilder: (context, index) {
                  Meditation meditation = meditationsList[index];
                  return DisplayTrackWidget(
                    meditationServices: meditationServices,
                    meditation: meditation,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    );
  }
}
