import '../../Barrel/app_barrel.dart';
import '../../Models/progress_bar_state_model.dart';

class AudioNotifier extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();

  final _progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );

  ValueNotifier<ProgressBarState> get progressNotifier => _progressNotifier;

  final _buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  ValueNotifier<ButtonState> get buttonNotifier => _buttonNotifier;

  Future<void> loadUrl(String url) async {
    try {
      await _player.setUrl(url);
      _init();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void _init() {
    _player.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        _player.seek(Duration.zero);
        _player.pause();
      }
      notifyListeners();
    });

    _player.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
      notifyListeners();
    });

    _player.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
      notifyListeners();
    });

    _player.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
      notifyListeners();
    });

    play();
  }

  void play() {
    _player.play();
  }

  void pause() {
    _player.pause();
  }

  void seekToSlider(Duration duration) {
    _player.seek(duration);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
