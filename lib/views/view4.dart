import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:flutter/material.dart';

class View4 extends StatefulWidget {
  View4({this.args});

  final dynamic args;

  @override
  _View4State createState() => _View4State();
}

class _View4State extends State<View4> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return _buildView();
  }

  Widget _buildView() {
    return Container();
  }
}
