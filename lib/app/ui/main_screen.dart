import 'package:flutter/material.dart';
import 'package:so_stronk_challange/app/widgets/elipse_widget.dart';
import 'package:so_stronk_challange/utils/colors.dart';
import 'package:so_stronk_challange/utils/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _circular;
  int _count = 0;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _circular = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addListener(() {
      if (_controller.isCompleted && _count < 3) {
        Future.delayed(const Duration(milliseconds: 300)).then((value) {
          setState(() {
            _controller.forward(from: 0);
            _count++;
          });
        });
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                0.35
              ],
              colors: [
                ColorBase.darkBlue1,
                ColorBase.darkBlue,
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 120,
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  RotationTransition(
                    turns: _circular,
                    child: CenterElipseWidget(),
                  ),
                  MiddleElipseWidget(),
                  SmallerElipseWidget(),
                  CenterBeanWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
