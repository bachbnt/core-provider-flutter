import 'package:bach_flutter_app/app.dart';
import 'package:bach_flutter_app/configures/app_config.dart';
import 'package:bach_flutter_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.appFlavor = Flavor.PRODUCTION;
  AppConfig.appDesign = Design.MATERIAL;
  runApp(FlutterApp());
}
