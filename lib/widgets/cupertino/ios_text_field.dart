import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSTextField extends StatelessWidget {
  const IOSTextField(
      {Key key,
        this.hintText,
        this.labelText,
        this.errorText,
        this.controller,
        this.onChanged,
        this.obscureText = false})
      : super(key: key);

  final String hintText;
  final String labelText;
  final String errorText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: obscureText,
      controller: controller,
      placeholder: hintText,
      onChanged: onChanged,
    );
  }
}
