import 'package:flutter/cupertino.dart';

const double _kNavBarPersistentHeight = 44.0;

class IOSNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final String text;

  IOSNavigationBar({@required this.text});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(text),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_kNavBarPersistentHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
