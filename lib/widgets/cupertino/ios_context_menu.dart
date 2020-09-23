import 'package:flutter/cupertino.dart';

class IOSContextMenu extends StatelessWidget {
  const IOSContextMenu(
      {Key key,
      @required this.text,
      @required this.actionTexts,
      @required this.actionCallbacks})
      : super(key: key);

  final String text;
  final List<String> actionTexts;
  final List<VoidCallback> actionCallbacks;

  @override
  Widget build(BuildContext context) {
    return CupertinoContextMenu(
      child: Text('$text'),
      actions: actionTexts.length == actionCallbacks.length
          ? List<Widget>.generate(
              actionTexts.length,
              (index) => CupertinoContextMenuAction(
                    child: Text('${actionTexts[index]}'),
                    onPressed: actionCallbacks[index],
                  ))
          : [],
    );
  }
}
