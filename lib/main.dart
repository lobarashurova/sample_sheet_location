import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_sheet_location/common/gen/assets.gen.dart';
import 'package:sample_sheet_location/common/localization_utils/fixed_csv_asset_loader.dart';
import 'package:sample_sheet_location/home_page.dart';

import 'common/gen/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: Strings.supportedLocales,
    path: Assets.localization.translations,
    fallbackLocale: Strings.supportedLocales.first,
    startLocale: Strings.supportedLocales.first,
    assetLoader: FixedCsvAssetLoader(),
    child: const MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Translation App Demo',
      home: const TranslationHomePage(),
    );
  }
}

