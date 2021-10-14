import 'package:flutter/material.dart';
import 'package:so_stronk_challange/utils/assets.dart';
import 'package:so_stronk_challange/utils/flutter_screenutil.dart';

class CenterElipseWidget extends StatelessWidget {
  const CenterElipseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPNG.bgCircle,
      height: ScreenUtil().setHeight(370),
      width: ScreenUtil().setWidth(370),
    );
  }
}

class SmallerElipseWidget extends StatelessWidget {
  const SmallerElipseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPNG.ellipseSmall,
      height: ScreenUtil().setHeight(250),
      width: ScreenUtil().setWidth(250),
    );
  }
}

class MiddleElipseWidget extends StatelessWidget {
  const MiddleElipseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPNG.ellipseRegular,
      height: ScreenUtil().setHeight(310),
      width: ScreenUtil().setWidth(310),
    );
  }
}

class CenterBeanWidget extends StatelessWidget {
  const CenterBeanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetPNG.centerPiece);
  }
}

class TextBeanWidget extends StatelessWidget {
  const TextBeanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetPNG.textBean);
  }
}

class RegularBeanWidget extends StatelessWidget {
  const RegularBeanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetPNG.regularBean);
  }
}
