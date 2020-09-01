import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String errorText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  const CustomTextField(
      {Key key,
      this.hintText,
      this.labelText,
      this.errorText,
      this.controller,
      this.onChanged,this.obscureText=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText ?? hintText,
          labelText: labelText ?? labelText,
          errorText: errorText),
      onChanged: onChanged,
    );
  }
}
