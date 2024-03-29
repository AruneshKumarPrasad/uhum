import '../../../../../Barrel/app_barrel.dart';

class BodyRecommendedWidget extends StatefulWidget {
  const BodyRecommendedWidget({
    super.key,
    required this.mediaProp,
  });

  final Size mediaProp;

  @override
  State<BodyRecommendedWidget> createState() => _BodyRecommendedWidgetState();
}

class _BodyRecommendedWidgetState extends State<BodyRecommendedWidget> {
  late ScrollController _scrollController;
  double _leftGradientOpacity = 0.0;
  double _rightGradientOpacity = 1.0;

  final List<String> _holder = <String>[
    'assets/Home/images2/man.jpeg',
    'assets/Home/images2/leave.jpeg',
    'assets/Home/images3/green.jpeg',
    'assets/Home/images3/flowers.jpeg',
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScrollPosition = _scrollController.offset;
    double leftGradientOpacity = 0.0;
    double rightGradientOpacity = 0.0;

    if (currentScrollPosition > 10) {
      leftGradientOpacity = 1.0;
    }

    if (currentScrollPosition < maxScrollExtent - 10) {
      rightGradientOpacity = 1.0;
    }

    setState(() {
      _leftGradientOpacity = leftGradientOpacity;
      _rightGradientOpacity = rightGradientOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: widget.mediaProp.height * 0.25,
      width: widget.mediaProp.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommended",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: widget.mediaProp.height * 0.2,
            width: double.maxFinite,
            child: Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  itemCount: _holder.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: widget.mediaProp.height * 0.125,
                    width: widget.mediaProp.height * 0.275,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          _holder[index],
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: _leftGradientOpacity,
                  child: Container(
                    width: 10,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(0.75),
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.25),
                          Colors.white.withOpacity(0.00),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: _rightGradientOpacity,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 10,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.75),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.25),
                            Colors.white.withOpacity(0.00),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
