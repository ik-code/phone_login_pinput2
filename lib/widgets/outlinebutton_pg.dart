import 'package:flutter/material.dart';
import 'package:phone_login/utilities/constans.dart';


class OutlineButtonPG extends StatelessWidget {
  final String text;
  final VoidCallback onPressedHandler;

  const OutlineButtonPG(
      {required this.text, required this.onPressedHandler, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onPressedHandler,
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26.0),
      ),
      borderSide: const BorderSide(color: Color(0xFFFB8D1C)),
      child: Text(
        text,
        style: kButtonTextOrangeStyle,
      ),
    );
  }
}
