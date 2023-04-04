import '../../../Barrel/app_barrel.dart';
import '../widgets/body_popular_widget.dart';
import '../widgets/body_recommended_widget.dart';
import '../widgets/categories_widget.dart';
import '../widgets/go_to_widget.dart';
import '../widgets/my_sliver_app_bar_widget.dart';

class HomePageFragment extends StatelessWidget {
  const HomePageFragment({
    super.key,
    required this.mediaProp,
  });

  final Size mediaProp;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MySliverAppBarWidget(mediaProp: mediaProp),
        GoToWidget(mediaProp: mediaProp),
        CategoriesWidget(mediaProp: mediaProp),
        BodyRecommendedWidget(mediaProp: mediaProp),
        BodyPopularWidget(mediaProp: mediaProp),
      ],
    );
  }
}
