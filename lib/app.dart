import 'package:bach_flutter_app/app_localizations.dart';
import 'package:bach_flutter_app/app_router.dart';
import 'package:bach_flutter_app/configures/app_config.dart';
import 'package:bach_flutter_app/view_models/locale_model.dart';
import 'package:bach_flutter_app/view_models/theme_model.dart';
import 'package:bach_flutter_app/views/cupertino/ios_sign_in_view.dart';
import 'package:bach_flutter_app/views/material/android_sign_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class FlutterApp extends StatelessWidget {
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
          child: Banner(
            message: AppConfig.flavorName,
            color: AppConfig.flavorColor,
            location: BannerLocation.topStart,
            child: Banner(
              message: AppConfig.platformName,
              color: AppConfig.platformColor,
              location: BannerLocation.topEnd,
              child:
                  PlatformApp(themeModel: themeModel, localeModel: localeModel),
            ),
          ),
        );
      }),
    );
  }
}

class PlatformApp extends StatelessWidget {
  final ThemeModel themeModel;
  final LocaleModel localeModel;

  const PlatformApp({@required this.themeModel, @required this.localeModel});

  @override
  Widget build(BuildContext context) {
    return _buildPlatformApp();
  }

  Widget _buildPlatformApp() {
    if (AppConfig.isIOS())
      return CupertinoApp(
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: supportedLocales,
        theme: themeModel.cupertinoCurrentTheme,
        locale: localeModel.currentLocale,
        onGenerateRoute: CupertinoAppRouter.generateRoute,
        initialRoute: initialRoute,
        debugShowCheckedModeBanner: false,
        home: IOSSignInView(),
      );
    return MaterialApp(
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      theme: themeModel.materialCurrentTheme,
      locale: localeModel.currentLocale,
      onGenerateRoute: MaterialAppRouter.generateRoute,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
      home: AndroidSignInView(),
    );
  }
}
