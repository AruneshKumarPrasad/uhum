import '../../../../Barrel/app_barrel.dart';
import 'widgets/display_card_widget.dart';
import 'widgets/show_meditaions_cateogory_widgets.dart';
import 'widgets/show_recommended_track_widget.dart';

class MeditationPageFragment extends StatefulWidget {
  const MeditationPageFragment({Key? key, required this.mediaProp})
      : super(key: key);

  final Size mediaProp;

  @override
  State<MeditationPageFragment> createState() => _MeditationPageFragmentState();
}

class _MeditationPageFragmentState extends State<MeditationPageFragment> {
  final MeditationServices meditationServices = MeditationServices();

  @override
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: mediaProp.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Attention and Awareness",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                DisplayCardWidget(
                  slectedColor: const Color(0xFFCBECFF),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: mediaProp.height * 0.25,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCBECFF),
                      borderRadius: BorderRadius.circular(25 - 4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          ShowRecommendedTrackWidget(
            meditationServices: meditationServices,
          ),
          const SizedBox(
            height: 30,
          ),
          ShowMeditaionCategoriesWidget(
            meditationServices: meditationServices,
          ),
        ],
      ),
    );
  }
}
