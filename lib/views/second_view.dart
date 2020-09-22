import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class SecondView extends StatefulWidget {
  const SecondView(this.arguments);

  final dynamic arguments;

  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
