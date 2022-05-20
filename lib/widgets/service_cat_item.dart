import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phone_login/widgets/raised_btn_pg.dart';

import '../utilities/constans.dart';

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
    return GestureDetector(
      onTap: (() {
        print('Services id: $id');
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
