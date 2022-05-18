import 'package:flutter/material.dart';
import 'package:phone_login/screens/menu_screen.dart';
import 'package:phone_login/utilities/constans.dart';
import 'package:phone_login/widgets/logo_pg.dart';

class SGListSreen extends StatelessWidget {
  const SGListSreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // leading:
        // IconButton(
        //   icon: IconButton(
        //     icon: const Icon(Icons.menu),
        //     iconSize: 30,
        //     color: const Color(0xFF212121),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        toolbarHeight: 80,
        title: Row(
          children: [
            const SizedBox(width: 10,),
            const LogoPG(
                heightMarginTop: 0, imgFile: 'playground_logo_orange.png'),
              Spacer(),
            IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 40,
              color: const Color(0xFF212121),
              onPressed: () {
                                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MenuScreen()),
                      );
              },
            ),
          ],
        ),
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
