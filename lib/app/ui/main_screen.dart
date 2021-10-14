import 'package:flutter/material.dart';
import 'package:so_stronk_challange/app/widgets/elipse_widget.dart';
import 'package:so_stronk_challange/utils/colors.dart';
import 'package:so_stronk_challange/utils/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
                  CenterElipseWidget(),
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
