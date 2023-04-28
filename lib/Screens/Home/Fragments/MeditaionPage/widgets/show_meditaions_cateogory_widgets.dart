import '../../../../../Barrel/app_barrel.dart';
import 'display_category_widget.dart';

class ShowMeditaionCategoriesWidget extends StatelessWidget {
  const ShowMeditaionCategoriesWidget({
    super.key,
    required this.meditationServices,
  });

  final MeditationServices meditationServices;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FutureBuilder<List<MeditationCategory>>(
          future: meditationServices.getAllMeditationsCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MeditationCategory> meditationsCategoriesList =
                  snapshot.data!;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                ),
                itemCount: meditationsCategoriesList.length,
                itemBuilder: (context, index) {
                  MeditationCategory meditationsCategory =
                      meditationsCategoriesList[index];
                  return DisplayCatgoryWidget(
                    meditationsCategory: meditationsCategory,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
