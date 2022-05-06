import 'package:flutter/material.dart';
import 'package:phone_login/utilities/constans.dart';
import 'package:phone_login/widgets/logo_pg.dart';
import 'package:phone_login/widgets/raised_btn_pg.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({ Key? key }) : super(key: key);

  @override
  _CongratsScreenState createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     title: const Text(
    //       'Congrats Screen',
    //       style: TextStyle(
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Image.asset("images/logo_orange_final_screen.jpg")
    //     ],
    //   ),
    // );

return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const <Widget>[
                    LogoPG(
                      imgFile: 'logo_orange_final_screen.png',
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Congrats!',
                      style: kBigtitleTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                     Text(
                      'Your account is ready to use',
                      style: kSubtitleBlackTextStyle,
                    ),
                     SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              )),
              RaisedButtonPG(
                text: 'Go to Home Page',
                onPressedHandler: () {
                  print('Go to Home Page');
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}