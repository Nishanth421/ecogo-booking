import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/screens/splash/splash_screen.dart';


class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name ?? "");
    switch (uri.path) {
      case SplashScreen.path:
        return pageRoute(settings, const SplashScreen());
      default:
        return pageRoute(
            settings,
             Scaffold(
              appBar: AppBar(title: Text('')),
              body: Center(
                child: Text('page not found!'),
              ),
            ));
    }
  }

  static CupertinoPageRoute<dynamic> pageRoute(
      RouteSettings settings, Widget screen) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) => screen,
    );
  }
}
