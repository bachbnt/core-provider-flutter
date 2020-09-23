import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';

class IOSAlertDialog extends StatelessWidget {
  const IOSAlertDialog(
      {Key key,
      @required this.title,
      @required this.content,
      @required this.actionTexts,
      @required this.actionCallbacks})
      : super(key: key);

  final String title;
  final String content;
  final List<String> actionTexts;
  final List<VoidCallback> actionCallbacks;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('$title'),
      content: Text('$content'),
      actions: [
        CupertinoDialogAction(
          child: Text(AppStrings.cancel),
          onPressed: () => Navigator.of(context).pop(),
        )
      ]..addAll(actionTexts.length == actionCallbacks.length
          ? List<Widget>.generate(
              actionTexts.length,
              (index) => CupertinoDialogAction(
                    child: Text('${actionTexts[index]}'),
                    onPressed: actionCallbacks[index],
                  ))
          : []),
    );
  }
}
