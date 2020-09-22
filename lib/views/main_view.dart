import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/view_models/main_model.dart';
import 'package:bach_flutter_app/views/base_view.dart';
import 'package:bach_flutter_app/views/fifth_view.dart';
import 'package:bach_flutter_app/views/first_view.dart';
import 'package:bach_flutter_app/views/fourth_view.dart';
import 'package:bach_flutter_app/views/second_view.dart';
import 'package:bach_flutter_app/views/third_view.dart';
import 'package:bach_flutter_app/widgets/material/app_bottom_navigation.dart';
import 'package:bach_flutter_app/widgets/material/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final GlobalKey _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<MainModel>(
        model: MainModel(),
        onModelReady: (MainModel model) {
          model.initCurrentUser();
        },
        builder: (BuildContext context, MainModel model, _) {
          return Scaffold(
            key: _key,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                  '${toBeginningOfSentenceCase(AppLocalizations.of(context).translate(model.currentTitle))}'),
            ),
            // drawer: AppDrawer(
            //   currentUser: model.currentUser,
            //   callback: (MainViewChild view) {
            //     model.navigateView(view);
            //     Navigator.of(context).pop();
            //   },
            // ),
             bottomNavigationBar: AppBottomNavigation(
               callback: (view) => model.navigateView(view),
             ),
            body: _buildView(model.currentView, null),
          );
        });
  }

  Widget _buildView(MainViewChild view, dynamic arguments) {
    switch (view) {
      case MainViewChild.MainView1:
        return FirstView(arguments);
      case MainViewChild.MainView2:
        return SecondView(arguments);
      case MainViewChild.MainView3:
        return ThirdView(arguments);
      case MainViewChild.MainView4:
        return FourthView(arguments);
      case MainViewChild.MainView5:
        return FifthView(arguments);
      default:
        return FirstView(arguments);
    }
  }
}
