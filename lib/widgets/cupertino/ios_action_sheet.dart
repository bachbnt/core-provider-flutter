import 'package:bach_flutter_app/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';

class IOSActionSheet extends StatelessWidget {
  const IOSActionSheet(
      {Key key,
      @required this.title,
      @required this.message,
      @required this.actionTexts,
      @required this.actionCallbacks})
      : super(key: key);

  final String title;
  final String message;
  final List<String> actionTexts;
  final List<VoidCallback> actionCallbacks;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('$title'),
      message: Text('$message'),
      actions: actionTexts.length == actionCallbacks.length
          ? List<Widget>.generate(
              actionTexts.length,
              (index) => CupertinoActionSheetAction(
                    child: Text('${actionTexts[index]}'),
                    onPressed: actionCallbacks[index],
                  ))
          : [],
      cancelButton: CupertinoActionSheetAction(
        child: Text(AppStrings.cancel),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
