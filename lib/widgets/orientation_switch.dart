import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class OrientationSwitch extends StatelessWidget {
  const OrientationSwitch(
      {Key key,
      @required this.children,
      this.mainAxisSize = MainAxisSize.max,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.center})
      : super(key: key);

  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return Container(
      width: ScreenHelper.screenWidth,
      height: ScreenHelper.screenHeight,
      child: ScreenHelper.orientation == Orientation.portrait
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
