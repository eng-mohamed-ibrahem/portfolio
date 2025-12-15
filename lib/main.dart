import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/root_app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase init failed: $e");
  }
  if (kReleaseMode) {
    await SentryFlutter.init((options) {
      options.dsn =
          'https://c9ba0e12a4b3d200f74f81c30908dd32@o4508256906379264.ingest.de.sentry.io/4508370123292752';
      options.tracesSampleRate = .01;
    }, appRunner: () => runApp(const RootApp()));
  } else {
    runApp(const RootApp());
  }
}
