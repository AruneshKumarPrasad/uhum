import '../../../Barrel/app_barrel.dart';
import 'tab_label_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required TabController tabController,
    required this.provider,
  }) : _tabController = tabController;

  final TabController _tabController;
  final OnBoardingProvider provider;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: GestureDetector(
          onTap: () {
            if (_tabController.index == 0) {
              Navigator.of(context).pop();
            } else {
              _tabController.animateTo(_tabController.index - 1);
              provider.updateTabIndex(_tabController.index);
            }
          },
          child: Container(
            height: 50,
            width: 50,
            //margin: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xff7758F6),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      actions: [
        const Spacer(
          flex: 7,
        ),
        Expanded(
          flex: 8,
          child: IgnorePointer(
            child: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(
                  child: TabLabelWidget(
                    label: '1',
                  ),
                ),
                Tab(
                  child: TabLabelWidget(
                    label: '2',
                  ),
                ),
                Tab(
                  child: TabLabelWidget(
                    label: '3',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
