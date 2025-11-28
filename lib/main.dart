import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/service_locator/setup_dependencies.dart';
import 'package:portfolio/core/utils/bloc_observer.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/root_app.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  VisibilityDetectorController.instance.updateInterval = Duration.zero;
  Bloc.observer = MyBlocObserver();
  setUpDepdencies();
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://c9ba0e12a4b3d200f74f81c30908dd32@o4508256906379264.ingest.de.sentry.io/4508370123292752';
        options.tracesSampleRate = .01;
      },
      appRunner: () => runApp(const RootApp()),
    );
  } else {
    runApp(const RootApp());
  }
}
