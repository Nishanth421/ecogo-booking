import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../gen/colors.gen.dart';
import '../../../helper/shared_preperence_helper.dart';
import '../../../styleguide/typography.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/submit_button.dart';

class ProfileScreen extends StatelessWidget {
  static const String path = '/Profile';
   ProfileScreen({super.key});

  final AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: ColorName.background,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        body: Padding(padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Center(
                  child: Icon(Icons.person,size: 25),
                ),
              ),
            ),
            Gap(10),
            Center(
              child: Text(SharedPrefService.instance.getUser()?.email??"",
                  style: placeholder),
            ),
            Spacer(),
            SubmitButton(
              "Log out",
              onTap: (loader) async {
                _authBloc.logout();
                }
            ),
            Gap(50),
          ],
        ),)
    );
  }
}
