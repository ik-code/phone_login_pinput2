import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_login/screens/home_screen.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPControllerScreen extends StatefulWidget {
  final String phone;
  final String codeDigits;

  const OTPControllerScreen(
      {required this.phone, required this.codeDigits, Key? key})
      : super(key: key);

  @override
  State<OTPControllerScreen> createState() => _OTPControllerScreenState();
}

class _OTPControllerScreenState extends State<OTPControllerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? verificationCode;

  // ignore: prefer_const_constructors
  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey));

  @override
  void initState() {
    super.initState();

    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.codeDigits + widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
              duration: const Duration(seconds: 3),
            ),
          );
        },
        codeSent: (String vID, int? resentToken) {
          setState(() {
            verificationCode = vID;
          });
        },
        codeAutoRetrievalTimeout: (String vID){
          setState(() {
            verificationCode = vID;
          });
        },
        timeout: const Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('OTP Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('images/otp.png'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  verifyPhoneNumber();
                },
                child: Text(
                  "Verifying: ${widget.codeDigits}-${widget.phone}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(32.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 24, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinOTPCodeFocus,
                controller: _pinOTPCodeController,
                submittedFieldDecoration: pinOTPCodeDecoration,
                followingFieldDecoration: pinOTPCodeDecoration,
                pinAnimationType: PinAnimationType.none,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: verificationCode.toString(),
                            smsCode: pin))
                        .then((value) {
                      if (value.user != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid OTP'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
