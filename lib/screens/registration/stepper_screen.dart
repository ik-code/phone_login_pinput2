import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_login/config/api_connection.dart';
import 'package:phone_login/screens/registration/otp_controller_registration_screen.dart';
import 'package:phone_login/screens/singin_to_account_screen.dart';

import 'package:phone_login/utilities/constans.dart';
import 'package:phone_login/widgets/raised_btn_pg.dart';
import 'package:phone_login/widgets/stepper_pg.dart';
import '../../utilities/validation.dart';
import 'package:http/http.dart' as http;

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _activeCurrentStep = 0;
  bool isCompleted = false;
  bool isChecked = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController checkbox = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();

  String dialCodeDigits = "+00";

  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();

  final _emailFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();
  final _passwordFocusNode2 = FocusNode();

  bool _isPasswordVisible = true;
  bool _isPasswordVisible2 = true;

  bool btnRegisterAccount = false;

  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];

  void accountRegistration() async {
    ApiConnection apiConnection = ApiConnection(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phoneNumber: (dialCodeDigits.substring(1) + phoneNumber.text),
        password: password.text,
        passwordConfirm: password2.text);
    try {
      http.Response response =
          await http.post(apiConnection.registration(), body: {
        "first_name": firstName.text,
        "last_name": lastName.text,
        "email": email.text,
        "phone_number": (dialCodeDigits.substring(1) + phoneNumber.text),
        "password": password.text,
        "password_confirm": password2.text
      });

      if (response.statusCode == 200 &&
          (jsonDecode(response.body)['message'] != null)) {
        print(response.statusCode);
        String resBody = response.body;
        var message = jsonDecode(resBody)['message'];
        var message0 = jsonDecode(resBody)['message'][0];
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
        print(resBody);

        //disable btn 'Register Account'
        btnRegisterAccount = true;

      } else {
        print('Error');
      }
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    }
  }

  // Center buildComplete() {
  //   return Center(
  //     child: Column(
  //       children: <Widget>[
  //         const Text('Completed!!!'),
  //         ElevatedButton(
  //           onPressed: (() {
  //             setState(() {
  //               _activeCurrentStep = 0;
  //               isCompleted = false;

  //               firstName.clear();
  //               lastName.clear();

  //               email.clear();
  //               phoneNumber.clear();
  //               checkbox.clear();

  //               password.clear();
  //               passwordConfirm.clear();
  //             });
  //           }),
  //           child: const Text('Reset'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  List<StepPG> stepList() => [
        StepPG(
          state: _activeCurrentStep <= 0
              ? StepPGState.indexed
              : StepPGState.indexed,
          isActive: _activeCurrentStep >= 0,
          title: const Text(''),
          content: Form(
            key: _formKeys[0],
            child: Column(
              children: [
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (firstNameInput) {
                    if (firstNameInput!.length < 2) {
                      return 'First Name must be greater than 1 characters';
                    }
                    if (firstNameInput.isValidName) {
                      return 'Enter valid First Name';
                    }
                    return null;
                  },
                  controller: firstName,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: _firstNameFocusNode.hasFocus
                          ? const Color(0xFF898A8D)
                          : const Color(0xFF898A8D),
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Image.asset('images/user.png'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'First Name',
                    labelText: 'First Name *',
                    hintStyle: kInputHintTextStyle,
                    errorStyle: kErrorTextStyle,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Color(0xFFFB8D1C),
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: kInputTextStyle,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  focusNode: _firstNameFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_lastNameFocusNode);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (lastNameInput) {
                    if (lastNameInput!.length < 2) {
                      return 'Last Name must be greater than 1 characters';
                    }
                    if (lastNameInput.isValidName) {
                      return 'Enter valid Last Name';
                    }
                    return null;
                  },
                  controller: lastName,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: _lastNameFocusNode.hasFocus
                          ? const Color(0xFF898A8D)
                          : const Color(0xFF898A8D),
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Image.asset('images/user.png'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Last Name',
                    labelText: 'Last Name *',
                    hintStyle: kInputHintTextStyle,
                    errorStyle: kErrorTextStyle,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                        color: Color(0xFFFB8D1C),
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: kInputTextStyle,
                  //textInputAction: TextInputAction.none,
                  keyboardType: TextInputType.text,
                  focusNode: _lastNameFocusNode,
                  // onFieldSubmitted: (_) {
                  //   FocusScope.of(context).requestFocus(_lastNameFocusNode);
                  // },
                ),
                const SizedBox(
                  height: 126,
                ),
              ],
            ),
          ),
        ),
        StepPG(
            state: _activeCurrentStep <= 1
                ? StepPGState.indexed
                : StepPGState.indexed,
            isActive: _activeCurrentStep >= 1,
            title: const Text(''),
            content: Form(
              key: _formKeys[1],
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: _emailFocusNode.hasFocus
                            ? const Color(0xFF898A8D)
                            : const Color(0xFF898A8D),
                        fontFamily: 'Manrope',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: Image.asset('images/envelope.png'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: 'Email',
                      labelText: 'Email *',
                      hintStyle: kInputHintTextStyle,
                      errorStyle: kErrorTextStyle,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFFB8D1C),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: kInputTextStyle,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _emailFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_phoneNumberFocusNode);
                    },
                    validator: (emailInput) {
                      if (!emailInput!.isValidEmail) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
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
                  TextFormField(
                    controller: phoneNumber,
                    maxLength: 10,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[0-9]"),
                      )
                    ],
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: _phoneNumberFocusNode.hasFocus
                            ? const Color(0xFF898A8D)
                            : const Color(0xFF898A8D),
                        fontFamily: 'Manrope',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      prefix: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          dialCodeDigits,
                          style: kInputTextStyle,
                        ),
                      ),
                      suffixIcon: Image.asset('images/phone.png'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: 'Phone Number',
                      labelText: 'Phone Number *',
                      hintStyle: kInputHintTextStyle,
                      errorStyle: kErrorTextStyle,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFFB8D1C),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: kInputTextStyle,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    focusNode: _phoneNumberFocusNode,
                    validator: (phoneInput) {
                      if (!phoneInput!.isValidPhone) {
                        return 'Enter a valid Phone Number';
                      }

                      return null;
                    },
                    onSaved: (inputPhone) {
                      print('${inputPhone}');
                    },
                    onFieldSubmitted: (_) {
                      //_formKeys[_activeCurrentStep].currentState!.validate();
                      print('${phoneNumber.text}');
                    },
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.72,
                        child: Checkbox(
                            activeColor: kOrangePG,
                            checkColor: kWhitePG,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                      ),
                      const Text(
                        'Enable push notifiications',
                        style: kSmallTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 58,
                  ),
                ],
              ),
            )),
        StepPG(
            state: _activeCurrentStep <= 2
                ? StepPGState.indexed
                : StepPGState.indexed,
            isActive: _activeCurrentStep >= 2,
            title: const Text(''),
            content: Form(
              key: _formKeys[2],
              child: Column(
                children: [
                  buildPassword(),
                  const SizedBox(
                    height: 50,
                  ),
                  buildPassword2(),
                  const SizedBox(
                    height: 126,
                  ),
                ],
              ),
            )),
        // StepPG(
        //     state: StepPGState.complete,
        //     isActive: _activeCurrentStep >= 3,
        //     title: const Text('Confirm'),
        //     content: Column(
        //       crossAxisAlignment: CrossAxisAlignment.stretch,
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         Text('First Name: ${firstName.text}'),
        //         Text('Last Name: ${lastName.text}'),
        //         Text('Email : ${email.text}'),
        //         Text('Phone Number : ${dialCodeDigits + phoneNumber.text}'),
        //         Text('Checkbox : $isChecked'),
        //         Text('Password : ${password.text}'),
        //         Text('Password Confirm : ${password2.text}'),
        //       ],
        //     ),
        //   )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: StepperPG(
              //https://api.flutter.dev/flutter/material/Stepper-class.html

              type: StepperTypePG.horizontal,
              currentStep: _activeCurrentStep,
              steps: stepList(),
              onStepContinue: () {
                //Button Continue
                final isLastStep = _activeCurrentStep == stepList().length - 1;

                if (isLastStep) {
                  //alternatively we can set flag isCompleted to true
                  setState(() => isCompleted = true);

                  print('Competed');

                  //SMS Firebase validation

                  print(dialCodeDigits);
                  print(phoneNumber.text);

                  if (isChecked) {
                    //send data to the server
                    accountRegistration();
                    Timer(
                        const Duration(seconds: 5),
                        () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                OTPControllerRegistrationScreen(
                                  phone: phoneNumber.text,
                                  codeDigits: dialCodeDigits,
                                ))));
                  }
                } else {
                  //increment
                  if (_formKeys[_activeCurrentStep].currentState!.validate()) {
                    print('CurrentSteop: $_activeCurrentStep');
                    setState((() => {
                          if (_activeCurrentStep == 1 && isChecked == false)
                            {_activeCurrentStep}
                          else
                            {_activeCurrentStep += 1}
                        }));
                  }
                }
              },
              onStepCancel: () {
                //Button Cancel
                //decrement
                _activeCurrentStep > 0
                    ? setState((() => _activeCurrentStep -= 1))
                    : null;
              },
              onStepTapped: (int index) {
                //Go to Step by index
                setState(() {
                  _activeCurrentStep = index;
                });
              },
              //Custom Buttons Next and Cancel
              controlsBuilder:
                  (BuildContext context, ControlsDetailsPG details) {
                final isLastStep = _activeCurrentStep == stepList().length - 1;
                return Row(
                  children: <Widget>[
                    Expanded(
                      // child: ElevatedButton(
                      //   onPressed: details.onStepContinue,
                      //   child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                      // ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Already have an account?",
                              ),
                              FlatButton(
                                child: const Text('Sign in'),
                                textColor: Colors.orange,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SinginToAccountScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RaisedButtonPG(
                            text: isLastStep ? 'Register Account' : 'Next',
                            onPressedHandler: btnRegisterAccount ? null : details.onStepContinue,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width: _activeCurrentStep != 0 ? 12 : 0),
                    // if (_activeCurrentStep != 0)
                    //   Expanded(
                    //     child: ElevatedButton(
                    //       onPressed: details.onStepCancel,
                    //       child: const Text('BACK'),
                    //     ),
                    //   ),
                  ],
                );
              },
            ),
          ),
        ));
  }

  Widget buildPassword() => TextFormField(
        controller: password,
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
        textInputAction: TextInputAction.next,
        obscureText: _isPasswordVisible,
        keyboardType: TextInputType.text,
        focusNode: _passwordFocusNode,
        validator: (inputPassword) {
          print(inputPassword);
          if (inputPassword == null || inputPassword.isEmpty) {
            return 'Please enter a password';
          }
          if (inputPassword.length < 8) {
            return 'Password must be at least 8 characters';
          }

          return null;
        },
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode2);
        },
      );

  Widget buildPassword2() => TextFormField(
        controller: password2,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: _passwordFocusNode2.hasFocus
                ? const Color(0xFF898A8D)
                : const Color(0xFF898A8D),
            fontFamily: 'Manrope',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintText: 'Password Confirm',
          labelText: 'Password Confirm *',
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
            icon: _isPasswordVisible2
                ? const Icon(
                    Icons.visibility_off,
                    color: Color(0xFFFB8D1C),
                  )
                : const Icon(Icons.visibility, color: Color(0xFFFB8D1C)),
            onPressed: () =>
                setState(() => _isPasswordVisible2 = !_isPasswordVisible2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: kInputTextStyle,
        textInputAction: TextInputAction.done,
        obscureText: _isPasswordVisible2,
        keyboardType: TextInputType.text,
        focusNode: _passwordFocusNode2,
        validator: (inputPassword2) {
          print(inputPassword2);
          if (inputPassword2 == null || inputPassword2.isEmpty) {
            return 'Please enter a password';
          }
          if (inputPassword2.length < 8) {
            return 'Password must be at least 8 characters';
          }
          if (password.text != inputPassword2.toString()) {
            print('Password :${password.text}');
            print('Password Confirm: $inputPassword2');
            return 'Password Confirm not equal Password';
          }

          return null;
        },
        onFieldSubmitted: (_) {
          // _formKeys[_activeCurrentStep].currentState!.validate();
        },
      );
}
