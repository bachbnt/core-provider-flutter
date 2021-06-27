import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  AppInput(
      {this.hintText,
      this.labelText,
      this.errorText,
      this.controller,
      this.onChanged,
      this.obscureText = false});

  final String hintText;
  final String labelText;
  final String errorText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool obscureText;

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