import 'package:bach_flutter_app/core/i18n/i18n.dart';
import 'package:bach_flutter_app/core/routes/mainRouter.dart';
import 'package:bach_flutter_app/core/routes/routeName.dart';
import 'package:bach_flutter_app/viewModels/localeModel.dart';
import 'package:bach_flutter_app/viewModels/themeModel.dart';
import 'package:bach_flutter_app/views/signInView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
        return Directionality(
            textDirection: TextDirection.ltr,
            child: MaterialApp(
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                I18n.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: supportedLocales,
              theme: themeModel.currentTheme,
              locale: localeModel.currentLocale,
              onGenerateRoute: MainRouter.generateRoute,
              initialRoute: RouteName.initial,
              debugShowCheckedModeBanner: false,
              home: SignInView(),
            ));
      }),
    );
  }
}
