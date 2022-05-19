import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/products.dart';
import '../../../utilities/constans.dart';
import '../../../widgets/product_item.dart';

class GetawaysListScreen extends StatelessWidget {
  final getawaysList;
   const GetawaysListScreen({Key? key, required this.getawaysList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final res = json.decode(response.body)["data"]["getaways"];
    var dataItem = json.decode(getawaysList)["data"]["getaways"];

    print('           dataItem: $dataItem');

    
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          const Text(
              'Welcome to Playground. Adults have more fun here! Book your ideal play date by choosing who will watch your children, getting your makeup done on demand, hiring a driver so you don’t need to worry about anything, book an experience or a yacht rental.',
              style: kGetawaysTextBlackStyle),
          const SizedBox(
            height: 24,
          ),
          //   Text(dataItem[0]["title"],)
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
            itemCount: dataItem.length,
            itemBuilder: (ctx, i) => ProductItem(
              dataItem[i]['id'],
              dataItem[i]['title'],
              dataItem[i]['price'].toDouble(),
              dataItem[i]['fee'],
              dataItem[i]['deposit'],
              dataItem[i]['pay_in_parts'],
              dataItem[i]['images'],
              dataItem[i]['description'],
              dataItem[i]['date_time'],
              dataItem[i]['duration_hours'],
              dataItem[i]['duration_minutes'],
              dataItem[i]['payment_type'],
              dataItem[i]['payment_parts_amount'],
              dataItem[i]['terms_and_conditions'],
              dataItem[i]['created_by_id'],
              dataItem[i]['created_at'],
              dataItem[i]['updated_at'],
            ),
          )
        ],
      ),
    );
  }
}
