import 'package:flutter/material.dart';
import 'package:phone_login/screens/singin_to_account_screen.dart';
import 'package:phone_login/utilities/constans.dart';
import 'package:phone_login/widgets/logo_pg.dart';
import 'package:phone_login/widgets/raised_btn_pg.dart';
import 'package:phone_login/widgets/stepper_pg.dart';

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
  TextEditingController passwordConfirm = TextEditingController();

  String _password = '';
  String _password2 = '';
  bool _isPasswordVisible = true;
  bool _isPasswordVisible2 = true;

  final _passwordFocusNode = FocusNode();
  final _passwordFocusNode2 = FocusNode();

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
          content: Column(
            children: [
              TextFormField(
                controller: firstName,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: _passwordFocusNode2.hasFocus
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
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: lastName,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: _passwordFocusNode2.hasFocus
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
              ),
              const SizedBox(
                height: 126,
              ),
            ],
          ),
        ),
        StepPG(
            state: _activeCurrentStep <= 1
                ? StepPGState.indexed
                : StepPGState.indexed,
            isActive: _activeCurrentStep >= 1,
            title: const Text(''),
            content: Column(
              children: [
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: _passwordFocusNode2.hasFocus
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
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: _passwordFocusNode2.hasFocus
                          ? const Color(0xFF898A8D)
                          : const Color(0xFF898A8D),
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: kWhitePG,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
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
            )),
        StepPG(
            state: _activeCurrentStep <= 2
                ? StepPGState.indexed
                : StepPGState.indexed,
            isActive: _activeCurrentStep >= 2,
            title: const Text(''),
            content: Column(
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
            )),
        // Step(
        // state: StepState.complete,
        // isActive: _activeCurrentStep >= 4,
        // title: const Text('Confirm'),
        // content: Container(
        //     child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Text('First Name: ${firstName.text}'),
        //     Text('Last Name: ${lastName.text}'),
        //     Text('Email : ${email.text}'),
        //     Text('Phone Number : ${phoneNumber.text}'),
        //   ],
        // )))
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
                  //send data to the server
                } else {
                  //increment
                  setState((() => _activeCurrentStep += 1));
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
                          SizedBox(
                            height: 20,
                          ),
                          RaisedButtonPG(
                            text: 'Next',
                            onPressedHandler: details.onStepContinue,
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
        onSaved: (inputPassword) {
          _password = inputPassword!;
          //data['password'] = inputPassword.toString();
        },
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode2);
        },
      );

  Widget buildPassword2() => TextFormField(
        onChanged: (inputPassword2) =>
            setState(() => _password2 = inputPassword2),
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
        textInputAction: TextInputAction.next,
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

          return null;
        },
        onSaved: (inputPassword2) {
          _password2 = inputPassword2!;
          // data['password_confirmation'] = inputPassword2.toString();
        },
        onFieldSubmitted: (_) {
          // _formKey.currentState!.validate();
        },
      );
}
