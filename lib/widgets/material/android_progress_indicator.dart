import 'package:flutter/material.dart';

class AndroidCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AndroidLinearProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LinearProgressIndicator(),
    );
  }
}
