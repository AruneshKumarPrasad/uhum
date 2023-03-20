import '../../Barrel/app_barrel.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFoldingCube(
      size: 40,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven
                ? Colors.deepPurpleAccent.shade100.withOpacity(0.5)
                : Colors.deepPurpleAccent,
          ),
        );
      },
    );
  }
}
