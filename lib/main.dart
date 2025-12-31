import 'package:ecogo_booking/styleguide/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_constants.dart';
import 'core/app_route.dart';
import 'env/development_env.dart';
import 'env/env.dart';
import 'env/production_env.dart';
import 'env/staging_env.dart';


void main() => getEnvironment();

getEnvironment() {
  // 0 - Development, 1 - Staging, 2 - Production
  // fetch environment value in const variable only.
  // set configuration --dart-define=ENVIRONMENT_TYPE=1
  // default production environment will be loaded.
  const environment = int.fromEnvironment(
    'ENVIRONMENT_TYPE',
    defaultValue: 2,
  );

  switch (EnvironmentType.values[environment]) {
    case EnvironmentType.development:
      return DevelopmentEnv();
    case EnvironmentType.staging:
      return StagingEnv();
    case EnvironmentType.production:
      return ProductionEnv();
    default:
      return ProductionEnv();
  }
}

  class MyApp extends StatefulWidget {
  final Env env;

  const MyApp({super.key, required this.env});

  @override
  State<MyApp> createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {

  @override
  void initState() {
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  ]);
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  navigatorKey: AppConstants.globalNavigatorKey,
  debugShowCheckedModeBanner: false,
  onGenerateRoute: Routes.onGenerateRoute,
  initialRoute: '/',
  theme: themeData,
  supportedLocales: const [
  Locale('en', 'IN'),
  ],
  locale: const Locale('en', 'IN'),
  title: AppConstants.appTitle,
  );
  }
  }
