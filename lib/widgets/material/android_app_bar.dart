import 'package:flutter/material.dart';

class AndroidAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AndroidAppBar({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Text('$text'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
