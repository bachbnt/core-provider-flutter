import 'package:bach_flutter_app/constants/definitions.dart';
import 'package:flutter/material.dart';

class CustomExpansion extends StatefulWidget {
  final Widget header;
  List<Widget> children;
  int itemCount;
  IndexedItemBuilder itemBuilder;

  CustomExpansion(
      {Key key, @required this.header, this.children = const <Widget>[]})
      : super(key: key);

  CustomExpansion.builder(
      {Key key,
      @required this.header,
      @required this.itemCount,
      @required this.itemBuilder})
      : super(key: key);

  @override
  _CustomExpansionState createState() => _CustomExpansionState();
}

class _CustomExpansionState extends State<CustomExpansion> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: widget.header,
        children:
            widget.itemCount != null ? _buildTileList() : widget.children);
  }

  List<Widget> _buildTileList() {
    List<Widget> tiles = [];
    for (int index = 0; index < widget.itemCount; index++)
      tiles.add(widget.itemBuilder(index));
    return tiles;
  }
}
