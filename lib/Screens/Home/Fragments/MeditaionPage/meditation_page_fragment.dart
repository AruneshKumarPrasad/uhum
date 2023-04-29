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
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFCBECFF),
                      borderRadius: BorderRadius.circular(25 - 4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: mediaProp.height * 0.2,
                          width: mediaProp.width * 0.4,
                          child: Image.asset(
                            'assets/Meditation/Meditation.png',
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Did you know?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: mediaProp.width * 0.4,
                              child: const Text(
                                  "body here - body here - body here - body here - body here - body here - body here - body here"),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: InkWell(
                                onTap: () {
                                  if (kDebugMode) {
                                    print("Start Listening tapped!");
                                  }
                                },
                                child: Container(
                                  height: mediaProp.height * 0.045,
                                  width: mediaProp.width * 0.4,
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(203, 234, 255, 1),
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text("Start Listening"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
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
