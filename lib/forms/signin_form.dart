import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:phone_login/config/api_connection.dart';
import 'package:phone_login/screens/sms_verification/login_screen.dart';
import 'package:phone_login/utilities/constans.dart';
import 'package:phone_login/widgets/logo_pg.dart';
import 'package:phone_login/widgets/raised_btn_pg.dart';

import 'package:http/http.dart' as http;

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  String apiPersonalAccessToken = '';
  String dialCodeDigits = "+1";
  final _formKey = GlobalKey<FormState>();
  String _phone = '';
  String _password = '';
  bool _isPasswordVisible = true;

  final _passwordFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();

  final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
  //RegExp(r'^[0-9]{3}-[0-9]{3}-[0-9]{4}$');

  String errorText = '';
  late IconData errorIcon;
  double errorContainerHeight = 0.0;

  @override
  void initState() {
    super.initState();
    print('initState called');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate called');
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();

    super.dispose();
  }

  void _saveForm() async {
    _formKey.currentState!.save();

    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      print('Error');
      return;
    }
    print('Form was submitted');
    print('DialCode: ${dialCodeDigits}');

    print('Phone: ${_phone}');
    print('Password: ${_password}');

    getData();
  }

  void getData() async {
    ApiConnection apiConnection = ApiConnection(
        phoneNumber: (dialCodeDigits + _phone), password: _password);

    http.Response response = await http.post(apiConnection.logInPostEndPoint());

    if (response.statusCode == 200 &&
        jsonDecode(response.body)['data'] != null) {
      String data = response.body;
      print(data);
      var apiToken = jsonDecode(data)['data']['api_personal_access_token'];
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('You are login')));
      print(apiToken);
      setState(() {
        apiPersonalAccessToken = apiToken;
      });
      print(apiPersonalAccessToken);
    }

    if (response.statusCode == 200 &&
        (jsonDecode(response.body)['message'] != null)) {
      print(response.statusCode);
      String msg = response.body;
      var err = jsonDecode(msg)['message'];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
      print(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build called');

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(children: <Widget>[
              const LogoPG(
                imgFile: 'playground_logo_orange.png',
              ),
              const SizedBox(
                height: 40,
              ),
              const Text('Sign in to your account', style: kSubtitleTextStyle),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 400,
                height: 48,
                child: CountryCodePicker(
                  onChanged: (country) {
                    setState(() {
                      dialCodeDigits = country.dialCode!;
                    });
                  },
                  initialSelection: "US",
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  favorite: const ["+1", "US", "+380", "UA"],
                ),
              ),
              buildPhone(),
              const SizedBox(
                height: 40,
              ),
              buildPassword(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    child: const Text('Forgot the password?'),
                    textColor: const Color(0xFF919191),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ]),
            const SizedBox(
              height: 110,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                    ),
                    FlatButton(
                      child: const Text('Sing up'),
                      textColor: Colors.orange,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                RaisedButtonPG(
                  text: 'Sing in',
                  onPressedHandler: () {
                    _saveForm();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildPhone() => TextFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: _passwordFocusNode.hasFocus
                ? const Color(0xFF898A8D)
                : const Color(0xFF898A8D),
            fontFamily: 'Manrope',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintText: 'Phone',
          prefix: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Text(
              dialCodeDigits,
              style: kInputTextStyle,
            ),
          ),
          hintStyle: kInputHintTextStyle,
          errorStyle: kErrorTextStyle,
          labelText: 'Phone *',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xFFFB8D1C),
              width: 2.0,
            ),
          ),
          suffixIcon: Image.asset('images/phone.png'),
          // IconButton(
          //   icon: const Icon(
          //     Icons.phone,
          //     color: Color(0xFFFB8D1C),
          //   ),
          //   onPressed: () {},
          // ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color(0xFFFB8D1C),
              )),
        ),
        style: kInputTextStyle,
        keyboardType: TextInputType.phone,
        maxLength: 10,
        focusNode: _phoneFocusNode,
        textInputAction: TextInputAction.next,
        onSaved: (value) {
          _phone = value!;
        },
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a phone number';
          }
          if (!phoneRegex.hasMatch(value)) {
            setState(() {
              errorContainerHeight = 35.0;
              errorIcon = FontAwesomeIcons.exclamationCircle;
              errorText = 'Field is empty.';
            });

            return 'Please enter a valid phone number';
          }
          return null;
        },
      );

  Widget buildPassword() => TextFormField(
        onChanged: (value) => setState(() => _password = value),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: _passwordFocusNode.hasFocus
                ? const Color(0xFF898A8D)
                : const Color(0xFF898A8D),
            fontFamily: 'Manrope',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintText: 'Password',
          labelText: 'Password *',
          hintStyle: kInputHintTextStyle,
          errorStyle: kErrorTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xFFFB8D1C),
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: _isPasswordVisible
                ? const Icon(
                    Icons.visibility_off,
                    color: Color(0xFFFB8D1C),
                  )
                : const Icon(Icons.visibility, color: Color(0xFFFB8D1C)),
            onPressed: () =>
                setState(() => _isPasswordVisible = !_isPasswordVisible),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: kInputTextStyle,
        obscureText: _isPasswordVisible,
        keyboardType: TextInputType.text,
        focusNode: _passwordFocusNode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          return null;
        },
        onSaved: (value) {
          _password = value!;
        },
        onFieldSubmitted: (_) {},
      );
}
