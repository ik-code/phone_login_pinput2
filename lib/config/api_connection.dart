class ApiConnection {
  final String serverUrl = 'https://lav.playground.wdscode.guru';

  String phoneNumber = '';
  String password = '';

  ApiConnection({  this.phoneNumber = '',  this.password =''});

  Uri logInPostEndPoint() {
    return Uri.parse(serverUrl +
        '/api/login?phone_number=${(phoneNumber)}&password=${password}');
  }

    Uri forgotPasswordSetPassword() {
    return Uri.parse(serverUrl + '/api/forgot-password-set-password');
  }
}

