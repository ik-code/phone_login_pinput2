class ApiConnection {
  final String _serverUrl = 'https://lav.playground.wdscode.guru';

  String phoneNumber = '';
  String password = '';
  String apiToken = '';

  ApiConnection({required this.phoneNumber, required this.password});

  Uri logInPostEndPoint() {
 
    return Uri.parse(_serverUrl +
        '/api/login?phone_number=${(phoneNumber).substring(1)}&password=${password}');
    // try {
    //   //aptiToken = lsjhflgjshldfgjh
    //   // ignore: await_only_futures, avoid_print
    //    print('${url}');
    // } catch (e) {
    //   print(e);
    // }
  }
}
