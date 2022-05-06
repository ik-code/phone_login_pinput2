import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_login/raw/error_message.dart';
import 'package:phone_login/screens/singin_singup_screen.dart';
import 'package:phone_login/screens/sms_verification/login_screen.dart';
import 'package:phone_login/screens/sms_verification/congrats_screen.dart';
import 'package:phone_login/screens/sms_verification/reset_password_screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({Key? key}) : super(key: key);
      

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
        primarySwatch: Colors.grey,
      ),
      home: //const ErrorMessage()
      const SingInSingUpScreen(),

      //---SMS Verification---
      //const LoginScreen(),
      // const ResetPasswordScreen(),
      // const CongratsScreen(),
    );
  }
}