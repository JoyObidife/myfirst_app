import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirst_app/provider/User_notifier.dart';
import 'package:myfirst_app/widgets/custom_button.dart';
import 'package:myfirst_app/widgets/custom_textfield.dart';
import 'package:myfirst_app/widgets/password_textfield.dart';
import 'package:myfirst_app/widgets/social_signin.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),
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
            SizedBox(height: 32),
            // textfield allow users to input text.
            CustomTextfield(
              label: "Email",
              textEditingController: emailController,
            ),
            SizedBox(height: 16),
            PasswordTextfield(
              textEditingController: passwordController,
              label: "Password",
            ),
            SizedBox(height: 16),
            CustomButton(
               text: "Login",
                onPressed: () {
                    // check email
                // if it is not valid, return and show message
                // check password
                // if it is not valid, return and show message
                // else take user to the next page.
                if (emailController.text != "joy@gmail.com") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Not a valid email. Try again")),
                  );

                  return;
                }

                if (passwordController.text != "1234") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Not a valid password. Try again")),
                  );
                  // for showing a dialog
                  //showDialog(context: context, builder: (context){
                  //return AlertDialog(
                    //content: Text("Not a valid password Try again"),
                    //actions: [],
                  //);
                  //});
                  return;
                }

                Navigator.of(context).pushNamed("/home");
                 
                },
              ),
            
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed("/forgot");
            }, child: Text("Forgot Password")),
            SizedBox(height: 24),

            SocialSignin(),

            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
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
