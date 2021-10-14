import 'package:flutter/material.dart';
import 'package:so_stronk_challange/app/widgets/center_elipse_widget.dart';
import 'package:so_stronk_challange/utils/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              CenterElipseWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
