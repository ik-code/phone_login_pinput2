class ApiConnection {
  final String serverUrl = 'https://lav.playground.wdscode.guru';

  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  String password = '';
  String passwordConfirm = '';

  ApiConnection({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.passwordConfirm = '',
  });

  Uri logInPostEndPoint() {
    return Uri.parse(
        serverUrl + '/api/login?phone_number=$phoneNumber&password=$password');
  }

  Uri forgotPasswordSetPassword() {
    return Uri.parse(serverUrl + '/api/forgot-password-set-password');
  }

  Uri registration() {
    return Uri.parse(serverUrl +
        '/api/registration?first_name=$firstName&last_name=$lastName&email=$email&password=$password&password_confirmation=$passwordConfirm&phone_number=$phoneNumber');
  }
}

class Failure {
  // Use something like "int code;" if you want to translate error messages
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
