import 'package:ecogo_booking/ui/widgets/custom_loader/custom_loader.dart';
import 'package:ecogo_booking/ui/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../../styleguide/dimensions.dart';

class SplashScreen extends StatelessWidget {
  static const String path = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: screenpaddingH,
          ).copyWith(bottom: MediaQuery.paddingOf(context).bottom > 0 ? 0 : 10),
          child: SubmitButton(
            "Let’s Begin",
            onTap: (loader) {
             // Navigator.pushReplacementNamed(context, WelcomeScreen.path);
              // await FirebaseAnalytics.instance.logSelectContent(
              //   contentType: "TEST",
              //   itemId: "1",
              // );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Center(child:AirplaneLoader())
          ],
        ),
      ),
    );
  }
}