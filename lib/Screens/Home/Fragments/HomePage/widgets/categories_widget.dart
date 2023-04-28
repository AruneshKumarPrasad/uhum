import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({
    Key? key,
    required this.mediaProp,
  }) : super(key: key);

  final Size mediaProp;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final ScrollController _scrollController = ScrollController();
  double _leftGradientOpacity = 0.0;
  double _rightGradientOpacity = 1.0;

  final List<String> _holder = [
    'Fitness and health',
    'Upgrade your life',
    'Daily reflection',
    'Holistic Well-Being'
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _leftGradientOpacity =
            _scrollController.position.pixels <= 0.0 ? 0.0 : 1.0;
        _rightGradientOpacity = _scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent
            ? 0.0
            : 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: widget.mediaProp.height * 0.06,
      width: widget.mediaProp.width,
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: _holder.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              height: widget.mediaProp.height * 0.06,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                _holder[index],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
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
    );
  }
}
