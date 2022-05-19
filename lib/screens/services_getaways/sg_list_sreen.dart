import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:phone_login/screens/menu_screen.dart';
import 'package:phone_login/screens/services_getaways/getaways/getaways_list_screen.dart';
import 'package:phone_login/screens/services_getaways/services/services_category_list_screen.dart';
import 'package:phone_login/utilities/constans.dart';
import 'package:phone_login/widgets/logo_pg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../main.dart';

class SGListSreen extends StatefulWidget {
  const SGListSreen({Key? key}) : super(key: key);

  @override
  State<SGListSreen> createState() => _SGListSreenState();
}

class _SGListSreenState extends State<SGListSreen> {
  final Uri _url =
      Uri.parse('https://lav.playground.wdscode.guru/api/getaways-list');

  dynamic _responseDataGetways;

  Future<void> _getDataGetways(url) async {
    final response = await http.get(url, headers: {
      'Authorization':   'Uk_9YrTcBzNrE8e4riECrNRikqWOtI9iyoljQ1GnCMtSzaRjV1wHWBh8OvZa'
      //Provider.of<Data>(context, listen: false).data['api_personal_access_token']
    });

    //final res = json.decode(response.body)["data"]["getaways"];
    final res = response.body;
    print('           res: ${res}');
    //print('           res: ${res[0]["title"]}');
    setState(() {
      _responseDataGetways = res;
    });

    print('          _responseDataGetways:         $_responseDataGetways');
  }

  @override
  void initState() {
    _getDataGetways(_url);

    super.initState();
  }

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
            const SizedBox(
              width: 10,
            ),
            const LogoPG(
                heightMarginTop: 0, imgFile: 'playground_logo_orange.png'),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 40,
              color: const Color(0xFF212121),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF4E9),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: ButtonsTabBar(
                      height: 54,
                      contentPadding:
                          const EdgeInsets.only(right: 56, left: 56),
                      backgroundColor: const Color(0xFFFB8D1C),
                      unselectedBackgroundColor: const Color(0xFFFFF4E9),
                      unselectedLabelStyle:
                          const TextStyle(color: Color(0xFF979797)),
                      radius: 100,
                      labelStyle: const TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      tabs: const [
                        Tab(
                          text: 'Services',
                        ),
                        Tab(
                          text: 'Getways',
                        ),
                      ]),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    const Center(
                      child: ServicesCategoryListScreen(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 24.0, left: 24.0, top: 24.0),
                      child: GetawaysListScreen(
                        getawaysList: _responseDataGetways,
                      ),
                    ),
                  ],
                )),
              ],
            )),
      ),
    );
  }
}
