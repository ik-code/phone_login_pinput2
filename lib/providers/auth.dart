import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  final String serverUrl = 'https://lav.playground.wdscode.guru';

  Future<void> signup(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    String password,
    String passwordConfirm,
  ) async {
    final url = Uri.parse(serverUrl +
        '/api/registration?first_name=$firstName&last_name=$lastName&email=$email&password=$password&password_confirmation=$passwordConfirm&phone_number=$phoneNumber');
    final response = await http.post(
      url,
      body: json.encode(
        {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone_number": phoneNumber,
          "password": password,
          "password_confirm": passwordConfirm
        },
      ),
    );
    print(json.decode(response.body));

    if (response.statusCode == 200 &&
        (jsonDecode(response.body)['message'] != null)) {
      print(response.statusCode);
      String resBody = response.body;
      var message = jsonDecode(resBody)['message'];
      print(message);
      // var message0 = jsonDecode(resBody)['message'][0];
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(message)));
      // print(resBody);

      //disable btn 'Register Account'
      //btnRegisterAccount = true;
    } else {
      print('Error');
    }
  }
}
