import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:imovie_app/app/app.dart';
import 'package:imovie_app/app/app_module.dart';
import 'package:imovie_app/firebase_options.dart';

import 'app/commons/app_services/utils.dart';
import 'app/commons/remote_config/remote_config.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await CustomRemoteConfig().initialize();

    Modular.setNavigatorKey(navigatorKey);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(
      ModularApp(
        module: AppModule(),
        child: const App(),
      ),
    );
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
