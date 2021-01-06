import 'package:clientsbook/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/common/const.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clients Book",
      theme: ThemeData(
        accentColor: primaryColor,
        primaryColor: primaryColor,
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: textColor),
          bodyText2: TextStyle(color: textColor),
          headline1: TextStyle(color: textColor),
          headline2: TextStyle(color: textColor),
          headline3: TextStyle(color: textColor),
          headline4: TextStyle(color: textColor),
          headline5: TextStyle(color: textColor),
          headline6: TextStyle(color: textColor),
          button: TextStyle(color: textColor),
          overline: TextStyle(color: textColor),
          caption: TextStyle(color: textColor),
          subtitle1: TextStyle(color: textColor),
          subtitle2: TextStyle(color: textColor),
        ).apply(bodyColor: Colors.white),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
    ),
  );
}
