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

  Future<void> login(
    String phoneNumber,
    String password,
  ) async {
    //return _authenticate(email, password, 'signInWithPassword');
    final url = Uri.parse(
        serverUrl + '/api/login?phone_number=$phoneNumber&password=$password');
    final response = await http.post(
      url,
      body: json.encode(
        {
          "phone_number": phoneNumber,
          "password": password,
        },
      ),
    );
    print(json.decode(response.body));

    if (response.statusCode == 200 &&
        jsonDecode(response.body)['data'] != null) {
      String res = response.body;
      print(res);
      var apiToken = jsonDecode(res)['data']['api_personal_access_token'];
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(const SnackBar(content: Text('You are logged in')));
      print('apiToken: $apiToken');

      // data['token'] = apiToken;
      // _formKey.currentState?.save();
      // Provider.of<Data>(context, listen: false).updateAccount(data);
      // _formKey.currentState?.reset();

      // print('Central State Sing Form: ${data}');

      // Timer(
      //     const Duration(seconds: 5),
      //     () => Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => SgListSreen())));
    }
    var statusCodeServer = response.statusCode;
    var resBody = jsonDecode(response.body);
    var message = resBody['message'];
    if (statusCodeServer == 200 &&
        (resBody['message'] != null) && resBody['status'] == 1 ) {
      print('statusCodeServer: $statusCodeServer');
      print('MessageApiLara: $message');
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
   
    } else if (statusCodeServer >= 400) {

      print('Error!');
      print('statusCodeServer: $statusCodeServer');

    } else if (resBody['status'] == 0 ){

      print('Warning ApiLara!');
      print('MessageApiLara: $message');

    }
  }
}
