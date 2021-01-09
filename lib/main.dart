import 'dart:io';

import 'package:beatbox_app/config.dart';
import 'package:beatbox_app/generated/l10n.dart';
import 'package:beatbox_app/screens/console_screen.dart';
import 'package:beatbox_app/screens/on_boarding_screen.dart';
import 'package:beatbox_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';

void main() async {
  var path = Directory.systemTemp.path;
  //var path = (await getApplicationDocumentsDirectory()).path;
  Hive..init(path);
  box = await Hive.openBox('beatBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: ThemeData.dark().copyWith(
        primaryColor: kActiveCardColor,
        scaffoldBackgroundColor: kInactiveCardColor,
      ),
      home: currentConfig.isFirstTime() ? OnBoardingScreen() : ConsoleScreen(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
