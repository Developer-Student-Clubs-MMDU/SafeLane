import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safelane/authentication/components/text_field.dart';
import 'package:safelane/authentication/login.dart';
import 'package:safelane/tabs/home.dart';

class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Sign Up",
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
                    decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  hintText: "Enter your Name",
                  border: InputBorder.none,
                )),
              ),
              TextFieldContainer(
                child: TextField(
                    decoration: InputDecoration(
                  suffixIcon: Icon(Icons.mail),
                  hintText: "Enter your email",
                  border: InputBorder.none,
                )),
              ),
              TextFieldContainer(
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.lock),
                      hintText: "Enter your password",
                      border: InputBorder.none,
                    )),
              ),
              TextFieldContainer(
                child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility_off),
                      hintText: "Confirm your password",
                      border: InputBorder.none,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Sign Up"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
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
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>loginScreen()),);
                        },
                        child: Text("Login")
                      )
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
