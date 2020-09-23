import 'package:flutter/cupertino.dart';

const double _kNavBarPersistentHeight = 44.0;

class IOSNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const IOSNavigationBar({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      automaticallyImplyLeading: true,
      middle: Text('$text'),
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
