import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:uhum/Barrel/app_barrel.dart';

import '../../Models/progress_bar_state_model.dart';
import '../../Provider/AudioPlayerScreen/audio_player_provider.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({
    super.key,
    required this.meditation,
  });
  static const String routeName = '/AudioPlayerScreen';

  final Meditation meditation;

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen>
    with TickerProviderStateMixin {
  late AudioNotifier audioNotifier;
  late AnimationController _playPauseController;
  @override
  void initState() {
    super.initState();
    _playPauseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    audioNotifier = Provider.of<AudioNotifier>(context, listen: false);
    audioNotifier.loadUrl(widget.meditation.audioUrl);
    audioNotifier.addListener(() {
      if (audioNotifier.buttonNotifier.value == ButtonState.playing) {
        _playPauseController.forward();
      } else {
        _playPauseController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _playPauseController.dispose();
    audioNotifier.dispose();
    super.dispose();
  }

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
              widget.meditation.imageUrl,
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
                      widget.meditation.imageUrl,
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
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<AudioNotifier>(
                builder: (context, audioNotifier, child) {
                  return ProgressBar(
                    timeLabelLocation: TimeLabelLocation.above,
                    progress: audioNotifier.progressNotifier.value.current,
                    buffered: audioNotifier.progressNotifier.value.buffered,
                    total: audioNotifier.progressNotifier.value.total,
                    onSeek: (value) => audioNotifier.seekToSlider(value),
                  );
                },
              ),
              SizedBox(
                height: mediaProp.height * 0.03,
              ),
              Consumer<AudioNotifier>(
                builder: (context, audioNotifier, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 32.0,
                        ),
                      ),
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 250),
                        crossFadeState: audioNotifier.buttonNotifier.value ==
                                ButtonState.loading
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: const CircularProgressIndicator(),
                        secondChild: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 25,
                          child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: IconButton(
                                icon: AnimatedIcon(
                                  color: Colors.white,
                                  icon: AnimatedIcons.play_pause,
                                  progress: _playPauseController,
                                ),
                                iconSize: 32.0,
                                onPressed: audioNotifier.buttonNotifier.value ==
                                        ButtonState.playing
                                    ? audioNotifier.pause
                                    : audioNotifier.play,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 32.0,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
