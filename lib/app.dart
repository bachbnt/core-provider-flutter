import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/configures/configure.dart';
import 'package:bach_flutter_app/view_models/locale_model.dart';
import 'package:bach_flutter_app/view_models/theme_model.dart';
import 'package:bach_flutter_app/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<ThemeModel>(
            create: (_) => ThemeModel(),
          ),
          ChangeNotifierProvider<LocaleModel>(
            create: (_) => LocaleModel(),
          )
        ],
        child: Consumer2<ThemeModel, LocaleModel>(builder: (BuildContext context,
            ThemeModel themeModel, LocaleModel localeModel, _) {
          return Banner(
            message: Configure.environmentName,
            color: Configure.environmentColor,
            location: BannerLocation.topEnd,
            child: MaterialApp(
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: supportedLocales,
              theme: themeModel.currentTheme,
              locale: localeModel.currentLocale,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: initialRoute,
              debugShowCheckedModeBanner: false,
              home: SignInView(),
            ),
          );
        }),
      ),
    );
  }
}