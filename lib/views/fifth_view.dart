import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class FifthView extends StatefulWidget {
  FifthView(this.arguments);

  final dynamic arguments;

  @override
  _FifthViewState createState() => _FifthViewState();
}

class _FifthViewState extends State<FifthView> {
  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
