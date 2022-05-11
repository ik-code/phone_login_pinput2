import 'package:flutter/material.dart';
import 'package:phone_login/utilities/constans.dart';
import 'package:phone_login/widgets/logo_pg.dart';

class SgListSreen extends StatelessWidget {
const SgListSreen({ Key? key }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: IconButton(
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
              child: const Icon(Icons.menu),
            ),
            iconSize: 30,
            color: const Color(0xFF212121),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 80,
        title: const LogoPG(imgFile: 'playground_logo_orange.png'),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Services and Getways',
              style: kBigtitleTextStyle,
            ),
            SizedBox(height: 80.0),
          ],
        ),
      ]),
    );
  }

}