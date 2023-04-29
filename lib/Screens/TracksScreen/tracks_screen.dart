import 'package:uhum/Barrel/app_barrel.dart';

class TracksScreen extends StatelessWidget {
  const TracksScreen({super.key, required this.meditationCategory});
  static const String routeName = '/TracksScreen';

  final MeditationCategory meditationCategory;

  @override
  Widget build(BuildContext context) {
    final MeditationServices meditationServices = MeditationServices();

    return Scaffold(
      appBar: AppBar(
        title: Text(meditationCategory.title),
        scrolledUnderElevation: 0.0,
      ),
      body: FutureBuilder(
        future: meditationServices.getMeditationFromCategory(
          categoryID: meditationCategory.id,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Meditation> meditationsList = snapshot.data!;
            return ListView.builder(
              itemCount: meditationsList.length,
              itemBuilder: (context, index) {
                Meditation meditation = meditationsList[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AudioPlayerScreen.routeName,
                      arguments: meditation,
                    );
                  },
                  leading: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(meditation.imageUrl),
                      ),
                    ),
                  ),
                  title: Text(meditation.title),
                  subtitle: Text(meditation.description),
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
      ),
    );
  }
}
