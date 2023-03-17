import '../../Barrel/app_barrel.dart';

class SourceButtonWidget extends StatelessWidget {
  const SourceButtonWidget({
    super.key,
    required this.mediaProp,
    required this.isCamera,
    required this.performAction,
  });

  final Size mediaProp;
  final bool isCamera;
  final Function performAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        performAction();
      },
      child: Card(
        child: SizedBox(
          height: mediaProp.height * 0.15,
          width: mediaProp.height * 0.17,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(
                      isCamera
                          ? Icons.camera_alt_rounded
                          : Icons.photo_size_select_actual_rounded,
                      color: Colors.deepPurpleAccent.shade400,
                    ),
                  ),
                ),
              ),
              Container(
                height: mediaProp.height * 0.04,
                alignment: Alignment.topCenter,
                child: Text(
                  isCamera ? 'Camera' : 'Gallery',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent.shade400,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
