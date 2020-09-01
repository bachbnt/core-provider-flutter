import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomFlatButton({Key key, @required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('$title'),
      onPressed: onPressed,
    );
  }
}
