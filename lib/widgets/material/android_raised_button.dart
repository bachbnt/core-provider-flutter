import 'package:flutter/material.dart';

class AndroidRaisedButton extends StatelessWidget {
  const AndroidRaisedButton({Key key, @required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('$title'),
      onPressed: onPressed,
    );
  }
}
