// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Audio stored`
  String get audioStored {
    return Intl.message(
      'Audio stored',
      name: 'audioStored',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get pause {
    return Intl.message(
      'Pause',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Playing...`
  String get playing {
    return Intl.message(
      'Playing...',
      name: 'playing',
      desc: '',
      args: [],
    );
  }

  /// `Recording...`
  String get recording {
    return Intl.message(
      'Recording...',
      name: 'recording',
      desc: '',
      args: [],
    );
  }

  /// `reset`
  String get reset {
    return Intl.message(
      'reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `BeatBox App`
  String get introTitle {
    return Intl.message(
      'BeatBox App',
      name: 'introTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start now to create your own music`
  String get introDetail {
    return Intl.message(
      'Start now to create your own music',
      name: 'introDetail',
      desc: '',
      args: [],
    );
  }

  /// `Can I...`
  String get permissionTitle {
    return Intl.message(
      'Can I...',
      name: 'permissionTitle',
      desc: '',
      args: [],
    );
  }

  /// `This App need audio and storage permission for work well\n\nGrant to play!`
  String get permissionDetail {
    return Intl.message(
      'This App need audio and storage permission for work well\n\nGrant to play!',
      name: 'permissionDetail',
      desc: '',
      args: [],
    );
  }

  /// `New features are coming`
  String get featuresTitle {
    return Intl.message(
      'New features are coming',
      name: 'featuresTitle',
      desc: '',
      args: [],
    );
  }

  /// `Check for new app version availability soon`
  String get featuresDetail {
    return Intl.message(
      'Check for new app version availability soon',
      name: 'featuresDetail',
      desc: '',
      args: [],
    );
  }

  /// `\n\nGive me a try!`
  String get testTitle {
    return Intl.message(
      '\n\nGive me a try!',
      name: 'testTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tap, double tap, long press... \n\nThe better way is trying`
  String get testDetail {
    return Intl.message(
      'Tap, double tap, long press... \n\nThe better way is trying',
      name: 'testDetail',
      desc: '',
      args: [],
    );
  }

  /// `Let's beat`
  String get lastTitle {
    return Intl.message(
      'Let\'s beat',
      name: 'lastTitle',
      desc: '',
      args: [],
    );
  }

  /// `Everything is ready to go!`
  String get lastDetail {
    return Intl.message(
      'Everything is ready to go!',
      name: 'lastDetail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
