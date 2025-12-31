import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../gen/colors.gen.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/submit_button.dart';

class SignupScreen extends StatefulWidget {
  static const String path = '/signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final AuthBloc _bloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorName.white,
        appBar: AppBar(title: Text("Signup",style: TextStyle(color: ColorName.black),),),
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
                CustomTextField.textFieldSingle(_confirmPasswordController,hintText: "Confirm password"),
                Gap(50),
                SubmitButton(
                  "Signup",
                  onTap: (loader) async {
                  if(_bloc.validation(email: _emailController.text, password: _passwordController.text,
                  confirmPassword: _confirmPasswordController.text,isFromSignUp: true)) {
                    loader();
                      await _bloc.signUp(
                        email: _emailController.text, password: _passwordController.text);
                    loader();

                  }
                  }
                )
              ],
            ),
          ),
        )
    );
  }
}
