import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/utils/observer/cubit_observer.dart';
import 'package:portfolio/root_app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = CubitObserver();
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://c9ba0e12a4b3d200f74f81c30908dd32@o4508256906379264.ingest.de.sentry.io/4508370123292752';
        options.tracesSampleRate = .01;
      },
      appRunner: () => runApp(
        EasyLocalization(
          path: 'lib/config/l10n/translation',
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          fallbackLocale: const Locale('en'),
          saveLocale: true,
          child: const RootApp(),
        ),
      ),
    );
  } else {
    runApp(
      EasyLocalization(
        path: 'lib/config/l10n/translation',
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        child: const RootApp(),
      ),
    );
  }
}
