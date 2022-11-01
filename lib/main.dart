import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safelane/authentication/create_new_password.dart';
import 'package:safelane/authentication/fogotpassword.dart';
import 'package:safelane/authentication/login.dart';
import 'package:safelane/authentication/otp_verify.dart';
import 'package:safelane/authentication/signup.dart';
import 'package:safelane/onBoarding/onbording.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:safelane/tabs/home.dart';


void main(){
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        )
      ),
      home: Onbording(),
    );
  }
}