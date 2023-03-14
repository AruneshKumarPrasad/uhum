import '../../../Barrel/app_barrel.dart';

class TabLabelWidget extends StatelessWidget {
  const TabLabelWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xffE4E2E6),
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff8A888C),
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
