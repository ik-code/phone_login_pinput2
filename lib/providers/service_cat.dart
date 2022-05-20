//import 'dart:convert';

import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;

class ServiceCat with ChangeNotifier {
  final int id;
  final String title;
  final String image;
  final String termsAndConditions;
  final String createdAt;
  final String updatedAt;


  ServiceCat(
      {
  required this.id,
  required this.title,
  required this.image,
  required this.termsAndConditions,
  required this.createdAt,
  required this.updatedAt,      
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
  //       'https://flutter-shop-db-realtime-default-rtdb.firebaseio.com/ServiceCats/$id.json'); //

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
