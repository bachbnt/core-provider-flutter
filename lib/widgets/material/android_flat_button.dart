import 'package:flutter/material.dart';

class AndroidFlatButton extends StatelessWidget {
  const AndroidFlatButton({Key key, @required this.title, this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('$title'),
      onPressed: onPressed,
    );
  }
}
