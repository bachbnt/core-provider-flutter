import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class FirstView extends StatefulWidget {
  FirstView(this.arguments);

  final dynamic arguments;

  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
