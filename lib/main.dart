import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/view_models/locale_model.dart';
import 'package:bach_flutter_app/view_models/theme_model.dart';
import 'package:bach_flutter_app/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeModel>(
        create: (_) => ThemeModel(),
      ),
      ChangeNotifierProvider<LocaleModel>(
        create: (_) => LocaleModel(),
      )
    ],
    child: OKToast(child: FlutterApp()),
  ));
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeModel, LocaleModel>(
      builder: (context, themeModel, localeModel, _) => MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocaleModel.locales,
        theme: themeModel.currentTheme,
        locale: localeModel.currentLocale,
        darkTheme: ThemeData.dark(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: initialRoute,
        home: SignInView(),
      ),
    );
  }
}
