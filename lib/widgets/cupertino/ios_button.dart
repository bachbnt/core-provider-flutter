import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSButton extends StatelessWidget {
  const IOSButton({Key key, @required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('$title'),
      onPressed: onPressed,
    );
  }
}
