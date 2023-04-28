import '../../../../../Barrel/app_barrel.dart';

class DisplayCardWidget extends StatelessWidget {
  const DisplayCardWidget({
    super.key,
    required this.slectedColor,
    required this.child,
    this.padding = EdgeInsets.zero,
  });

  final Color slectedColor;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      shadowColor: slectedColor,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: slectedColor.withOpacity(0.3),
              offset: const Offset(0, 8),
              blurRadius: 10,
              spreadRadius: 6,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
