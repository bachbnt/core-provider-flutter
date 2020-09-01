import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomRaisedButton({Key key, @required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('$title'),
      onPressed: onPressed,
    );
  }
}
