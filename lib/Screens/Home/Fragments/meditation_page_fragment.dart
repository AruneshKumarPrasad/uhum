import '../../../Barrel/app_barrel.dart';

class MeditationPageFragment extends StatelessWidget {
  const MeditationPageFragment({Key? key, required this.mediaProp})
      : super(key: key);

  final Size mediaProp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Mediation!"),
      ),
    );
  }
}
