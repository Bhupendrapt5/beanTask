import 'package:flutter/material.dart';
import 'package:so_stronk_challange/utils/assets.dart';

class ReactanlgeTableWidget extends StatelessWidget {
  const ReactanlgeTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Reactangle(),
        Positioned(
          top: 40,
          child: _SingleLine(),
        ),
      ],
    );
  }
}

class _Reactangle extends StatelessWidget {
  const _Reactangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPNG.reactangle,
    );
  }
}

class _SingleLine extends StatelessWidget {
  const _SingleLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPNG.linearLine,
    );
  }
}
