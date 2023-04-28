import 'package:cached_network_image/cached_network_image.dart';
import 'package:uhum/Screens/Home/Fragments/MeditaionPage/widgets/display_card_widget.dart';

import '../../../../../Barrel/app_barrel.dart';

class DisplayCatgoryWidget extends StatelessWidget {
  const DisplayCatgoryWidget({
    super.key,
    required this.meditationsCategory,
  });

  final MeditationCategory meditationsCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        TracksScreen.routeName,
        arguments: meditationsCategory,
      ),
      child: DisplayCardWidget(
        slectedColor: Colors.black54,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(meditationsCategory.imageURL),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Text(
              meditationsCategory.title,
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
