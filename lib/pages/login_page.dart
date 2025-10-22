import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirst_app/widgets/custom_textfield.dart';
import 'package:myfirst_app/widgets/password_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120,),
            Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: GoogleFonts.play(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
           
               Text(
              "Glad To Have You Here",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32,),
            // textfield allow users to input text.
            CustomTextfield(
              label: "Email",
            ),
            SizedBox(height: 16,),
            
            PasswordTextfield(),
            SizedBox(height: 16,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 55), // width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                  
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {}, 
              child: Text("Login"),
              ),
              
        SizedBox(height: 24,),
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Divider()),
            Text("Sign up with"),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 12,),
        Row(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(onTap: (){}, child:  Image.asset("assets/facebook.png", width: 50, height: 50,)),
            InkWell(onTap: (){}, child:  Image.asset("assets/linkedin.png", width: 50, height: 50,)),
            InkWell(onTap: (){}, child:   Image.asset("assets/twitter.png", width: 50, height: 50,)),
          ],
        ),
        
        SizedBox(height: 36,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, 
              spacing: 4,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/signup");
                },
                  child: Text("Sign Up", style: TextStyle(color: Colors.blue)),
                ),
              ],

        ),
           
          ],
        ),
      ),
    );
  }
}

