import 'package:flutter/material.dart';
import 'package:so_stronk_challange/app/widgets/elipse_widget.dart';
import 'package:so_stronk_challange/utils/colors.dart';
import 'package:so_stronk_challange/utils/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _fadeController;
  late final Animation<double> _circular;
  late final Animation<double> _opacity1;
  int _count = 0;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _circular = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && _count < 2) {
          Future.delayed(const Duration(milliseconds: 300)).then((value) {
            _controller.forward(from: 0);
            _count++;
          });
        }
      });
    _opacity1 = Tween(begin: 1.0, end: 0.0).animate(_fadeController);

    _controller.forward();
    _fadeController.forward();
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
                  Positioned(
                    left: 10,
                    child: FadeTransition(
                      opacity: _opacity1,
                      child: RegularBeanWidget(),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 20,
                    child: FadeTransition(
                      opacity: _opacity1,
                      child: RegularBeanWidget(),
                    ),
                  ),
                  Positioned(
                    right: -20,
                    bottom: 20,
                    child: FadeTransition(
                      opacity: _opacity1,
                      child: RegularBeanWidget(),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    bottom: -20,
                    child: FadeTransition(
                      opacity: _opacity1,
                      child: RegularBeanWidget(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
