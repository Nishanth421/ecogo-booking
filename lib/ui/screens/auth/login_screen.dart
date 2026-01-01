import 'package:ecogo_booking/styleguide/typography.dart';
import 'package:ecogo_booking/ui/screens/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../gen/colors.gen.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/submit_button.dart';

class LoginScreen extends StatefulWidget {
  static const String path = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final AuthBloc _bloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.white,
        appBar: AppBar(title: Text("Login",style: TextStyle(color: ColorName.black),),
            automaticallyImplyLeading: false),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
               children: [
                 Gap(50),
                 CustomTextField.textFieldSingle(_emailController,hintText: "Email"),
                 Gap(25),
                 CustomTextField.textFieldSingle(_passwordController,hintText: "Password"),
                 Gap(25),
                 SubmitButton(
                   "Log in",
                   onTap: (loader) async {
                     if(_bloc.validation(email: _emailController.text, password: _passwordController.text)) {
                       loader();
                        await _bloc.login(email: _emailController.text,
                           password: _passwordController.text);
                     }
                   },
                 ),
                 Gap(50),
                 RichText(
                   text: TextSpan(
                     text: "Don't have an account? ",
                     style: TextStyle(color: Colors.black, fontSize: 16),
                     children: [
                       TextSpan(
                         text: "Sign Up",
                         style: placeholder.w500.copyWith(color:Colors.blue),
                         recognizer: TapGestureRecognizer()
                           ..onTap = () {
                             Navigator.pushReplacementNamed(context, SignupScreen.path);
                           },
                       ),
                     ],
                   ),
                 ),
               ],
            ),
          ),
        )
    );
  }
}
