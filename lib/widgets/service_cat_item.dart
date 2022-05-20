import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../utilities/constans.dart';
import 'package:http/http.dart' as http;

class ServiceCatItem extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final String termsAndConditions;
  final String createdAt;
  final String updatedAt;

  const ServiceCatItem(this.id, this.title, this.image, this.termsAndConditions,
      this.createdAt, this.updatedAt,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Uri _urlServicesCaPosttList = Uri.parse(
    //     'https://lav.playground.wdscode.guru/api/service-category-post-list?id=$id');

    // Future<void> _getDataServicesCatList(urlServicesCaPosttList) async {
    //   //_isLoadingServices = true;
    //   final response = await http.get(
    //     urlServicesCaPosttList, 
    //   headers: {
    //     'Authorization':
    //         // 'Uk_9YrTcBzNrE8e4riECrNRikqWOtI9iyoljQ1GnCMtSzaRjV1wHWBh8OvZa'
    //         Provider.of<Data>(context, listen: false)
    //             .data['api_personal_access_token']
    //   });

    //   final resBody = jsonDecode(response.body);

    //   if (resBody['status'] == 0) {
    //     //  _isLoadingServices = true;
    //     //  print('           _isLoadingServices:$_isLoadingServices');
    //     print(' Status 0          resServicesCatPostList: ${resBody}');
    //   } else {
    //     //    _isLoadingServices = false;
    //     // setState(() {
    //     //   _responseDataServicesCatList = resBody;
    //     // });
    //     print(' Status 1          resServicesCatPostList: ${resBody}');
    //   }

    //   // print('          _responseDataGetways:         $_responseDataS');
    // }

    return GestureDetector(
      onTap: (() {
        print('Services id: $id');
        //_getDataServicesCatList(_urlServicesCaPosttList);
      }),
      child: Card(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.3),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ClipRRect(
            child: Image.network(
              image.toString(),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(title, style: kServicesCatListTitleBlackStyle)
        ]),
      ),
    );
  }
}
