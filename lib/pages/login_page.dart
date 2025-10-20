import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';



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
              "Welcome Back",
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "Been A While",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32,),
            // textfield allow users to input text.
            TextField(
              // decoration allows you to style and customize the appearance of the input box
              decoration: InputDecoration(
                // border draws a visible rectangular border around your text field-just like a form box.
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                labelText: "Email",
              ),
            ),
            SizedBox(height: 16,),
            
            TextField(
                decoration: InputDecoration(
               border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                labelText: "Password",
              ),
              obscureText: true,
            ),
            // sizedBox is used to space the icons
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
            Divider(),
          ],
        ),
        SizedBox(height: 20,),
           Row(
            spacing: 28,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              SizedBox(height:20 ),
               Icon(FontAwesomeIcons.facebook,color: Colors.blue, size: 24,),
                Icon(FontAwesomeIcons.google,color:  Colors.red.shade900,size: 20,),
                Icon(FontAwesomeIcons.instagram,color: Colors.red,size: 24,),
              
             ],
           ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              spacing: 4,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                onTap: () {
                 //
                 //
                 Navigator.of(context).pushReplacementNamed("/signup");
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
      
          
            

            
          
        
          
        
      
    
  

