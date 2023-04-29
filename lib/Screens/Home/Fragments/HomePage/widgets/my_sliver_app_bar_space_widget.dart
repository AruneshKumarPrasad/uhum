import 'package:uhum/Barrel/app_barrel.dart';

class MySliverAppBarSpaceWidget extends StatelessWidget {
  const MySliverAppBarSpaceWidget({
    super.key,
    required this.mediaProp,
  });

  final Size mediaProp;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/Home/images/appbar_image.jpeg',
            ),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 30,
          width: 90,
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: (mediaProp.height * 0.3) * 0.2,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.grey,
            radius: 50,
            child: const FittedBox(
                fit: BoxFit.scaleDown, child: Text("Read More")),
          ),
        ),
      ),
      centerTitle: false,
      titlePadding: EdgeInsets.only(
        bottom: (mediaProp.height * 0.3) * 0.35,
        left: 20,
        right: 20,
      ),
      title: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Keep seeking whatever',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'matters to you',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
