import 'widgets/my_sliver_app_bar_space_widget.dart';
import '../../../../Barrel/app_barrel.dart';
import 'widgets/body_popular_widget.dart';
import 'widgets/body_recommended_widget.dart';
import 'widgets/categories_widget.dart';
import 'widgets/go_to_widget.dart';

class HomePageFragment extends StatefulWidget {
  const HomePageFragment({
    super.key,
    required this.mediaProp,
    required this.scaffoldKey,
  });

  final Size mediaProp;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomePageFragment> createState() => _HomePageFragmentState();
}

class _HomePageFragmentState extends State<HomePageFragment> {
  final ScrollController _scrollController = ScrollController();
  bool isCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < widget.mediaProp.height * 0.15) {
        setState(() {
          isCollapsed = false;
        });
      } else {
        setState(() {
          isCollapsed = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: widget.mediaProp.height * 0.25,
            scrolledUnderElevation: 0.0,
            pinned: true,
            flexibleSpace: MySliverAppBarSpaceWidget(
              mediaProp: mediaProp,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: isCollapsed ? Colors.black : Colors.white,
              ),
              onPressed: () {
                widget.scaffoldKey.currentState!.openDrawer();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: isCollapsed ? Colors.black : Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ],
          ),
        ];
      },
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: !isCollapsed
                ? EdgeInsets.zero
                : EdgeInsets.only(
                    top: widget.mediaProp.height * 0.1,
                  ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                GoToWidget(mediaProp: widget.mediaProp),
                CategoriesWidget(mediaProp: widget.mediaProp),
                BodyRecommendedWidget(mediaProp: widget.mediaProp),
                BodyPopularWidget(mediaProp: widget.mediaProp),
              ],
            ),
          );
        },
      ),
    );
  }
}
