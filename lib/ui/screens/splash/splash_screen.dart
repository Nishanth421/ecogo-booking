import 'package:ecogo_booking/ui/screens/auth/signup_screen.dart';
import 'package:ecogo_booking/ui/widgets/custom_loader/custom_loader.dart';
import 'package:ecogo_booking/ui/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../helper/shared_preperence_helper.dart';
import '../../../styleguide/dimensions.dart';
import '../auth/login_screen.dart';
import '../dashBoard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   Future.delayed(Duration(seconds:3 ),(){
     if(SharedPrefService.instance.getUser() != null){
       Navigator.pushReplacementNamed(context, DashboardScreen.path);
     }else{
       Navigator.pushReplacementNamed(context, SignupScreen.path);
     }

   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Center(child:Assets.svgs.icEcogo.svg())
            ],
          ),
        ),
      ),
    );
  }
}