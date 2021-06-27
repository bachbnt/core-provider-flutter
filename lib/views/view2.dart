import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:flutter/material.dart';

class View2 extends StatefulWidget {
  View2({this.args});

  final dynamic args;

  @override
  _View2State createState() => _View2State();
}

class _View2State extends State<View2> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
