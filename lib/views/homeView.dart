import 'package:bach_flutter_app/core/routes/routeName.dart';
import 'package:bach_flutter_app/utils/screenUtil.dart';
import 'package:bach_flutter_app/viewModels/homeModel.dart';
import 'package:bach_flutter_app/views/baseView.dart';
import 'package:bach_flutter_app/views/settingView.dart';
import 'package:bach_flutter_app/views/view1.dart';
import 'package:bach_flutter_app/views/view2.dart';
import 'package:bach_flutter_app/views/view3.dart';
import 'package:bach_flutter_app/views/view4.dart';
import 'package:bach_flutter_app/widgets/appBotNav.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return BaseView<HomeModel>(
        model: HomeModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                '${model.currentRoute}',
              ),
            ),
            // drawer: AppDrawer(
            //   callback: (route) {
            //     model.navigate(route);
            //     Navigator.of(context).pop();
            //   },
            // ),
            bottomNavigationBar: AppBotNav(
              callback: (route) => model.navigate(route),
            ),
            body: _buildView(model.currentRoute),
          );
        });
  }

  Widget _buildView(String route, {dynamic args}) {
    switch (route) {
      case RouteName.view1:
        return View1(args: args);
      case RouteName.view2:
        return View2(args: args);
      case RouteName.view3:
        return View3(args: args);
      case RouteName.view4:
        return View4(args: args);
      case RouteName.setting:
        return SettingView();
      default:
        return View1(
          args: args,
        );
    }
  }
}
