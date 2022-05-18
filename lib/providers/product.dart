//import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final int id;
  final String title;
  final String price;
  final String fee;
  final double deposit;
  final int pay_in_parts;
  final List<dynamic> images;
  final String description;
  final String date_time;
  final int duration_hours;
  final int duration_minutes;
  final String payment_type;
  final int payment_parts_amount;
  final String terms_and_conditions;
  final int created_by_id;
  final String created_at;
  final String updated_at;

  Product(
      {
  required this.id,
  required this.title,
  required this.price,
  required this.fee,
  required this.deposit,
  required this.pay_in_parts,
  required this.images,
  required this.description,
  required this.date_time,
  required this.duration_hours,
  required this.duration_minutes,
  required this.payment_type,
  required this.payment_parts_amount,
  required this.terms_and_conditions,
  required this.created_by_id,
  required this.created_at,
  required this.updated_at,
      
      });

  // void _setFavValue(bool newValue) {
  //   isFavorite = newValue;
  //   notifyListeners();
  // }

  // Future<void> toggleFavoriteStatus() async {
  //   final oldStatus = isFavorite;
  //   isFavorite = !isFavorite;
  //   notifyListeners();
  //   final url = Uri.parse(
  //       'https://flutter-shop-db-realtime-default-rtdb.firebaseio.com/products/$id.json'); //

  //   try {
  //     final response = await http.patch(url,
  //         body: json.encode({
  //           'isFavorite': isFavorite,
  //         }));
  //     if (response.statusCode >= 400) {
  //       _setFavValue(oldStatus);
  //     }
  //   } catch (error) {
  //     _setFavValue(oldStatus);
  //   }
  // }
}
