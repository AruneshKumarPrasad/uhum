import 'package:google_fonts/google_fonts.dart';
import 'package:uhum/Barrel/app_barrel.dart';
import 'package:uhum/Screens/Home/widgets/log_out_loader_widget.dart';

import '../../../sharepge.dart';

class MySliverAppBarWidget extends StatelessWidget {
  const MySliverAppBarWidget({
    super.key,
    required this.mediaProp,
  });

  final Size mediaProp;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      floating: false,
      delegate: CustomSliverAppBarDelegate(
        minHeight: mediaProp.height * 0.3,
        maxHeight: mediaProp.height * 0.3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
            image: DecorationImage(
              image: AssetImage('assets/Home/images/appbar_image.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).padding.top,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    // Sign-out logic

                    showModalBottomSheet(
                      context: context,
                      builder: (context) => LogoutLoaderWidget(
                        mediaProp: mediaProp,
                      ),
                    );
                    await Future.delayed(Duration(seconds: 2));
                    await UserServices.instance.signOut().then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LandingScreen(),
                            ),
                          ),
                        );
                  },
                ),
              ),
              Positioned(
                top: mediaProp.height * 0.12,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keep seeking whatever',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'matters to you',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: mediaProp.height * 0.04,
                      width: mediaProp.width * 0.2,
                      padding: EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: TextButton(
                          onPressed: () {
                            // Read More logic
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const sharepge(),
                              ),
                            );
                          },
                          child: Text(
                            'Read More',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  CustomSliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant CustomSliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
