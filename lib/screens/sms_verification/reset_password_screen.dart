import 'package:flutter/material.dart';
import 'package:phone_login/forms/confirm_pass_form.dart';
import 'package:phone_login/utilities/constans.dart';




class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      icon: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            Color(0xFFFEFBDA),
                            Color(0xFFFEE9D2),
                          ]),
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                      iconSize: 24,
                      color: const Color(0xFF212121),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children:  const <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Reset Password',
                      style: kBigtitleTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const <Widget>[
                     SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Your account is ready to use',
                      style: kSubtitleBlackTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const ConfirmPastForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
