import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class ThirdView extends StatefulWidget {
  ThirdView(this.arguments);

  final dynamic arguments;

  @override
  _ThirdViewState createState() => _ThirdViewState();
}

class _ThirdViewState extends State<ThirdView> {
  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
