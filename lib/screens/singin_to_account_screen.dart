import 'package:flutter/material.dart';
import 'package:phone_login/forms/signin_form.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({ Key? key }) : super(key: key);

  static const String id = 'singin_to_account_screen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:  const SigninForm(),
          ),
      )
    );
  }
}