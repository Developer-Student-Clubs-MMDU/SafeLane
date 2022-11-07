import 'dart:ffi';
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safelane/authentication/components/text_field.dart';
import 'package:safelane/authentication/fogotpassword.dart';
import 'package:safelane/authentication/signup.dart';
import 'package:safelane/tabs/home.dart';

class loginScreen extends StatelessWidget {
  
  const loginScreen({Key? key}) : super(key: key);
   
  @override
  
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    Future signIn() async {
      print("Sign in function ${emailController.text.trim()} ");
    
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .then((value) => {
                  print("value"),
             
                });
      } on FirebaseAuthException catch (err) {
        print(err);
      }
    }

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "Login",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldContainer(
              child: TextField(
                controller: emailController,
                  decoration: InputDecoration(
                suffixIcon: Icon(Icons.mail),
                hintText: "Enter your email",
                border: InputBorder.none,
              )),
            ),
            TextFieldContainer(
              child: TextField(
                controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    hintText: "Enter your password",
                    border: InputBorder.none,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => forgotPassword()),
                      );
                    },
                    child: Text("Forgot Password?"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    },
                    child: Text("Get in"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  color: Color(0xffDBDBDB),
                  width: 80,
                  height: 5,
                ),
                Text(
                  "Or",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  color: Color(0xffDBDBDB),
                  width: 80,
                  height: 5,
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 25),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff7A7A7A),
                  ),
                  child: Icon(
                    Icons.phone_android,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff7A7A7A),
                  ),
                  child: Icon(
                    Icons.g_mobiledata,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? "),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => signUp()),
                      );
                    },
                    child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    ));
  }

}
