import 'package:flutter/material.dart';

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
          Text(id.toString()),
          Text(title),
          Text(price.toString()),
          Text(fee),
          Text(deposit.toString()),
          Text(payInParts.toString()),
          Text(images.toString()),
          Text(description),
          Text(dateTime),
          Text(durationHours.toString()),
          Text(durationMinutes.toString()),
          Text(paymentType),
          Text(paymentPartsAmount.toString()),
          Text(termsAndConditions),
          Text(createdById.toString()),
          Text(createdAt),
          Text(updatedAt),
      ]
    );
  }
}
