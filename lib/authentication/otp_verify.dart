import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safelane/authentication/fogotpassword.dart';
import 'package:safelane/authentication/login.dart';


class otpForm extends StatelessWidget {
  const otpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Back",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>forgotPassword()),);
            },
          ),
        ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "Verify your Email",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Please enter 4 digit code sent \nto your email",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xff7A7A7A)),
              ),
            ),
            Form(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                
                height: 68,
                width: 64,
                decoration: BoxDecoration(
                  color: Color(0xffECEBEB),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  
                ),
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "0",
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffECEBEB),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 68,
                width: 64,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "0",
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffECEBEB),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 68,
                width: 64,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "0",
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffECEBEB),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 68,
                width: 64,
                child: TextFormField(
                  onChanged: (value) {
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "0",
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              )
            ]
          )
        ),
        SizedBox(height: size.height*0.05,),
            Container(
              width: size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Reset Password"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}