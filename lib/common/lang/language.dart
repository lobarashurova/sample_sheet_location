
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum Language {
  RU,
  EN,
  KG;

  static Language from(BuildContext context) {
    return Language.values.firstWhere(
          (element) => element.locale.languageCode == context.locale.languageCode,
    );
  }
}

extension LanguageExtensions on Language {
  String get name {
    switch (this) {
      case Language.EN:
        return 'English';
      case Language.RU:
        return 'Русский';
      case Language.KG:
        return "Кыргызча";
    }
  }

  Locale get locale {
    switch (this) {
      case Language.EN:
        return const Locale('en', 'US');
      case Language.RU:
        return const Locale('ru', 'RU');
      case Language.KG:
        return const Locale("ky", "KG");
    }
  }
}
