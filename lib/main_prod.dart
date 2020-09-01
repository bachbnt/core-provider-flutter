import 'package:bach_flutter_app/app.dart';
import 'package:bach_flutter_app/configures/configure.dart';
import 'package:bach_flutter_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Configure.appFlavor = Flavor.PROD;
  runApp(FlutterApp());
}
