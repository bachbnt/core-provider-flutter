import 'package:flutter/cupertino.dart';

class IOSContextMenu extends StatelessWidget {
  final String text;
  final List<String> actionTexts;
  final List<VoidCallback> actionCallbacks;

  IOSContextMenu(
      {@required this.text,
      @required this.actionTexts,
      @required this.actionCallbacks});

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      child: Text(text),
      actions: actionTexts.length == actionCallbacks.length
          ? List<Widget>.generate(
              actionTexts.length,
              (index) => CupertinoContextMenuAction(
                    child: Text(actionTexts[index]),
                    onPressed: actionCallbacks[index],
                  ))
          : [],
    );
  }
}
