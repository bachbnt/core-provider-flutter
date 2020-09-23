import 'package:flutter/cupertino.dart';

class IOSButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  IOSButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }
}
