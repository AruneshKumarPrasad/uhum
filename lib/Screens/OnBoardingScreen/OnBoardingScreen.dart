import 'package:provider/provider.dart';
import 'package:uhum/Provider/OnBoardingScreen/on_boarding_provider.dart';

import '../../Barrel/app_barrel.dart';
import 'Fragments/profile_info.dart';
import 'widgets/tab_label_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  late TabController _tabController;

  void _scrollToNextTab() {
    if (_tabController.index < 2) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaProp = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              if (_tabController.index == 0) {
                Navigator.of(context).pop();
              } else {
                _tabController.animateTo(_tabController.index - 1);
                context
                    .read<OnBoardingProvider>()
                    .updateTabIndex(_tabController.index);
              }
            },
            child: Container(
              margin: const EdgeInsets.all(6),
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
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileInfoFragment(
                    mediaProp: mediaProp,
                    firstnameController: _firstnameController,
                    lastnameController: _lastnameController,
                  ),
                  const Center(
                    child: TabLabelWidget(
                      label: '2',
                    ),
                  ),
                  const Center(
                    child: TabLabelWidget(
                      label: '3',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 75,
              width: mediaProp.width * 1.2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () {
                    _scrollToNextTab();
                    context
                        .read<OnBoardingProvider>()
                        .updateTabIndex(_tabController.index);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7758F6),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    context.watch<OnBoardingProvider>().tabIndex == 2
                        ? 'Done'
                        : 'Continue',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
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
