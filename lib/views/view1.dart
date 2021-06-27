import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:flutter/material.dart';

class View1 extends StatefulWidget {
  View1({this.args});

  final dynamic args;

  @override
  _View1State createState() => _View1State();
}

class _View1State extends State<View1> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
