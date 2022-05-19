import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phone_login/widgets/raised_btn_pg.dart';

import '../utilities/constans.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String fee;
  final double deposit;
  final int payInParts;
  final List<dynamic> images;
  final String description;
  final String dateTime;
  final int durationHours;
  final int? durationMinutes;
  final String paymentType;
  final int paymentPartsAmount;
  final String termsAndConditions;
  final int createdById;
  final String createdAt;
  final String updatedAt;

  const ProductItem(
      this.id,
      this.title,
      this.price,
      this.fee,
      this.deposit,
      this.payInParts,
      this.images,
      this.description,
      this.dateTime,
      this.durationHours,
      this.durationMinutes,
      this.paymentType,
      this.paymentPartsAmount,
      this.termsAndConditions,
      this.createdById,
      this.createdAt,
      this.updatedAt,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Card(
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.4),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Text(id.toString()),
            // FadeInImage(
            //   placeholder: const AssetImage("images/placeholder.jpg"),
            //   image: NetworkImage(images[0].toString(), headers: {
            //     "Authorization":
            //         "qlVuKcnbSINtcp2iqXSPb8fWR32QPb5cOcQoIlJgArQZtMERXzaE02IvOR5H"
            //   }),
            // ),
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child:Image.asset('images/getaways_demo.jpg'),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 18, left: 18, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(title, style: kGetawaysTitleBlackStyle),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    DateFormat.yMMMMd('en_US').format(DateTime.parse(dateTime)),
                    style: kGetawaysDateTimeStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Duration ',
                        style: kGetawaysDurationStyle,
                      ),
                      Text(
                        durationHours.toString() + ' hours',
                        style: kGetawaysDurationStyle,
                      ),
                      const Text(
                        ' ',
                        style: kGetawaysDurationStyle,
                      ),
                      Text(
                        durationMinutes.toString() + ' min',
                        style: kGetawaysDurationStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    style: kGetawaysDescriptisonStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$ ' + price.toString(),
                        style: kGetawaysPriceStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  RaisedButtonPG(text: 'View', onPressedHandler: () {})
                ],
              ),
            )

            // Text(fee),
            // Text(deposit.toString()),
            // Text(payInParts.toString()),

            // Text(paymentType),
            // Text(paymentPartsAmount.toString()),
            // Text(termsAndConditions),
            // Text(createdById.toString()),
            // Text(createdAt),
            // Text(updatedAt),
          ]),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
