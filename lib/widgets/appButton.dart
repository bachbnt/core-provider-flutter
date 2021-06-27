import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({@required this.title, this.onPressed});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('$title'),
      onPressed: onPressed,
    );
  }
}
