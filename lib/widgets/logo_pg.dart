import 'package:flutter/material.dart';

class LogoPG extends StatelessWidget {
  final String imgFile;

  const LogoPG({required this.imgFile, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const SizedBox(
          height: 40,
        ),
        Image(
          image:
              AssetImage('images/${imgFile}'),
        ),
      ],
    );
  }
}
