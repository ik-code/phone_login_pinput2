import 'package:flutter/material.dart';
import 'package:phone_login/widgets/exclamation.dart';

class ErrorMessage extends StatefulWidget {
  const ErrorMessage({Key? key}) : super(key: key);

  @override
  ErrorMessageState createState() => ErrorMessageState();
}

class ErrorMessageState extends State<ErrorMessage> {
  final textController = TextEditingController();
  String errorText = '';
  bool error = false;
  double errorContainerHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Test'),
            ),
            body: Column(children: <Widget>[
              Container(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.arrow_drop_down,
                        size: 35.0,
                      ),
                      labelStyle: const TextStyle(fontSize: 18.0),
                      labelText: 'Hint text',
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: errorText.isEmpty
                              ? const Color(0xFFC1C1C1)
                              : const Color(0xFFD32F2F),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: errorText.isEmpty
                                ? const Color(0xFF2196F3)
                                : const Color(0xFFD32F2F),
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  )),
              Exclamation(errorContainerHeight: 20, error: error? error: error, errorText: 'Some Error', backgroundColor: const Color.fromARGB(22, 234, 63, 63), textColor: const Color.fromARGB(255, 228, 48, 41), assetPath: 'images/exclamation.png'),
                
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (textController.text.isEmpty) {
                      setState(() {
                        errorContainerHeight = 35.0;
                        error = true;
                        errorText = 'Field is empty.';
                      });
                    } else {
                      setState(() {
                        errorContainerHeight = 0.0;
                        error = false;
                        errorText = '';
                      });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ))
            ]),)
            );
  }
}
