
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


import '../firebase_options.dart';
import '../helper/shared_preperence_helper.dart';
import '../main.dart';

abstract class Env {
  final String domainUrl;
  static late Env instance;
  String? signature = "3GUT6hx@nYQe8SpAAKwzxx3K!cfQLQe=";

  Env({
    required this.domainUrl,
  }) {
    boot();
  }
  void boot() async {
    instance = this;
    WidgetsFlutterBinding.ensureInitialized();
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
    GoogleFonts.config.allowRuntimeFetching = false;

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseAuth.instance.setLanguageCode('en');
    SharedPrefService.instance.init();
    runApp(MyApp(
      env: this,
    ));
  }
}

enum EnvironmentType { development, staging, production }
