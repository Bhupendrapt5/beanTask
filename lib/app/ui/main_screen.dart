import 'package:flutter/material.dart';
import 'package:so_stronk_challange/app/widgets/elipse_widget.dart';
import 'package:so_stronk_challange/app/widgets/table_widget.dart';
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
  late final AnimationController _fadeController2;
  late final Animation<double> _circular;
  late final Animation<double> _opacity1;
  late final Animation<double> _opacity2;

  ValueNotifier<List<TextBeanWidget>> _textBeanList =
      ValueNotifier<List<TextBeanWidget>>([]);
  int _count = 0;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeController2 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _circular = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && _count < 2) {
          Future.delayed(const Duration(milliseconds: 200)).then((value) {
            _controller.forward(from: 0);
            _count++;
          });
        }
      });
    _opacity1 = Tween(begin: 1.0, end: 0.0).animate(_fadeController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _addBeanitems();
          _fadeController2.forward();
        }
      });
    _opacity2 = Tween(begin: 0.0, end: 1.0).animate(_fadeController2)
      ..addStatusListener((status) {
        if (_count != 2) {
          if (status == AnimationStatus.completed) {
            _fadeController2.reverse();
            _addBeanitems();
          } else if (status == AnimationStatus.dismissed) {
            _fadeController2.forward();
          }
        }
      });
    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      _controller.forward();
      _fadeController.forward();
    });

    super.initState();
  }

  void _addBeanitems() {
    _textBeanList.value = List.from(_textBeanList.value)
      ..addAll(
        List<TextBeanWidget>.generate(4, (index) => TextBeanWidget()),
      );
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: ScreenUtil().setHeight(120)),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RotationTransition(
                      turns: _circular,
                      child: CenterElipseWidget(),
                    ),
                  ),
                  MiddleElipseWidget(),
                  SmallerElipseWidget(),
                  CenterBeanWidget(),
                  Positioned.fill(
                    child: FadeTransition(
                      opacity: _opacity1,
                      child: _BeanSetOne(),
                    ),
                  ),
                  Positioned.fill(
                    child: FadeTransition(
                      opacity: _opacity2,
                      child: _BeanSetTwo(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(40)),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setHeight(40)),
                    child: ReactanlgeTableWidget(),
                  ),
                  Positioned.fill(
                    top: 40,
                    left: 0,
                    child: ValueListenableBuilder<List<TextBeanWidget>>(
                        valueListenable: _textBeanList,
                        builder: (context, value, child) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Align(
                                alignment: Alignment.topLeft,
                                child: TextBeanWidget()),
                            itemCount: value.length,
                          );
                        }),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(120)),
            ],
          ),
        ),
      ),
    );
  }
}

class _BeanSetOne extends StatelessWidget {
  const _BeanSetOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      height: mediaQueryData.size.height,
      width: mediaQueryData.size.width,
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 120,
            child: RegularBeanWidget(),
          ),
          Positioned(
            right: 40,
            top: 30,
            child: RegularBeanWidget(),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: RegularBeanWidget(),
          ),
          Positioned(
            left: 30,
            bottom: -10,
            child: RegularBeanWidget(),
          ),
        ],
      ),
    );
  }
}

class _BeanSetTwo extends StatelessWidget {
  const _BeanSetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      height: mediaQueryData.size.height,
      width: mediaQueryData.size.width,
      child: Stack(children: [
        Positioned(
          left: 0,
          top: 40,
          child: RegularBeanWidget(),
        ),
        Positioned(
          right: 0,
          top: 40,
          child: RegularBeanWidget(),
        ),
        Positioned(
          right: 40,
          bottom: 80,
          child: RegularBeanWidget(),
        ),
        Positioned(
          left: 30,
          bottom: -10,
          child: RegularBeanWidget(),
        ),
      ]),
    );
  }
}
