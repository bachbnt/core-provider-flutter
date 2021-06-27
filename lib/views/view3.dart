import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:flutter/material.dart';

class View3 extends StatefulWidget {
  View3({this.args});

  final dynamic args;

  @override
  _View3State createState() => _View3State();
}

class _View3State extends State<View3> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
