import 'package:bach_flutter_app/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class FourthView extends StatefulWidget {
  FourthView(this.arguments);

  final dynamic arguments;

  @override
  _FourthViewState createState() => _FourthViewState();
}

class _FourthViewState extends State<FourthView> {
  @override
  Widget build(BuildContext context) {
    ScreenHelper.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
