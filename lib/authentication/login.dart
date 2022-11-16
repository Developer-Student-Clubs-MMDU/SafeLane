import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safelane/authentication/components/text_field.dart';
import 'package:safelane/authentication/fogotpassword.dart';
import 'package:safelane/authentication/signup.dart';
import 'package:safelane/tabs/home.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    //DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
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
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      final String email = emailController.text.trim();
                      final String passwpord = passwordController.text.trim();

                      if (email.isEmpty) {
                        print("Enter Email");
                      } else {
                        print("Enter Password ");
                      }

                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }).onError((error, stackTrace) {
                        
                      });
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
                Text("Create account"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => signUp()),
                      );
                    },
                    child: const Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
