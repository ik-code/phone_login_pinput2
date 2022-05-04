import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:phone_login/screens/otp_controller_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialCodeDigits = "+00";
  final TextEditingController _controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/login.jpg'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Center(
                  child: Text(
                    "Phone (OTP) Authentication",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 400,
                height: 60,
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
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    prefix: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(dialCodeDigits),
                    ),
                  ),
                  maxLength: 12,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OTPControllerScreen(
                              phone: _controller.text,
                              codeDigits: dialCodeDigits,
                            )));
                  },
                ),
              )
            ]),
      ),
    );
  }
}
