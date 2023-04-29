import '../../../../../Barrel/app_barrel.dart';

class GoToWidget extends StatefulWidget {
  const GoToWidget({
    Key? key,
    required this.mediaProp,
  }) : super(key: key);

  final Size mediaProp;

  @override
  State<GoToWidget> createState() => _GoToWidgetState();
}

class _GoToWidgetState extends State<GoToWidget> {
  final ScrollController _scrollController = ScrollController();
  double _leftGradientOpacity = 0.0;
  double _rightGradientOpacity = 1.0;

  final List<Map<String, String>> _holder = [
    {
      'title': 'UHUM kids',
      'image': 'assets/Home/images1/UHUM_kids.jpeg',
    },
    {
      'title': 'Meditation',
      'image': 'assets/Home/images1/flower.png',
    },
  ];

  String timeBasedGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _leftGradientOpacity = _scrollController.offset > 20 ? 1.0 : 0.0;
        _rightGradientOpacity = _scrollController.offset <
                _scrollController.position.maxScrollExtent - 20
            ? 1.0
            : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).currentUser!;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: widget.mediaProp.height * 0.23,
      width: widget.mediaProp.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${timeBasedGreeting()}! ",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                currentUser.firstName,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: widget.mediaProp.height * 0.15,
            width: double.maxFinite,
            child: Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  itemCount: _holder.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: widget.mediaProp.height * 0.15,
                    width: widget.mediaProp.height * 0.225,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(_holder[index]['image']!),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        _holder[index]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
          )
        ],
      ),
    );
  }
}
