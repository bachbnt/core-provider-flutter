import 'package:bach_flutter_app/utils/screen_util.dart';
import 'package:flutter/material.dart';

class OrientationSwitch extends StatelessWidget {

  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  const OrientationSwitch(
      {Key key,
        @required this.children,
        this.mainAxisSize = MainAxisSize.max,
        this.mainAxisAlignment = MainAxisAlignment.start,
        this.crossAxisAlignment = CrossAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtils.init(context);

    return Container(
      width: ScreenUtils.screenWidth,
      height: ScreenUtils.screenHeight,
      child: ScreenUtils.orientation == Orientation.portrait
          ? Column(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children)
          : Row(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children),
    );
  }
}
