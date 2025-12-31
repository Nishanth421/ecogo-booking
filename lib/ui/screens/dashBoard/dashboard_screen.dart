import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/submit_button.dart';

class DashboardScreen extends StatefulWidget {
  static const String path = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthBloc _authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: AppBar(title: Text("Login",style: TextStyle(color: ColorName.black),),),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SubmitButton(
            "Log out",
            onTap: (loader) async {
              _authBloc.logout();
            },
          )
        ],
      ),
    ),);
  }
}
