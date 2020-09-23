import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';

class IOSAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<String> actionTexts;
  final List<VoidCallback> actionCallbacks;

  IOSAlertDialog(
      {@required this.title,
      @required this.content,
      @required this.actionTexts,
      @required this.actionCallbacks});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          child: Text(AppStrings.cancel),
          onPressed: () => Navigator.of(context).pop(),
        )
      ]..addAll(actionTexts.length == actionCallbacks.length
          ? List<Widget>.generate(
              actionTexts.length,
              (index) => CupertinoDialogAction(
                    child: Text(actionTexts[index]),
                    onPressed: actionCallbacks[index],
                  ))
          : []),
    );
  }
}
