import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/auth/signup_screen.dart';
import '../ui/screens/dashBoard/dashboard_screen.dart';
import '../ui/screens/profile/profile_screen.dart';
import '../ui/screens/search/search_screen.dart';
import '../ui/screens/splash/splash_screen.dart';


class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name ?? "");
    switch (uri.path) {
      case SplashScreen.path:
        return pageRoute(settings, const SplashScreen());
      case SignupScreen.path:
        return pageRoute(settings, const SignupScreen());
      case LoginScreen.path:
        return pageRoute(settings, const LoginScreen());
      case DashboardScreen.path:
        return pageRoute(settings, const DashboardScreen());
      case SearchScreen.path:
        String tuiId = settings.arguments as String;
        return pageRoute(settings, SearchScreen(tuiId: tuiId,));
      case ProfileScreen.path:
        return pageRoute(settings,  ProfileScreen());
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
