import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirst_app/provider/user_notifier.dart';
import 'package:myfirst_app/widgets/custom_button.dart';
import 'package:myfirst_app/widgets/custom_textfield.dart';
import 'package:myfirst_app/widgets/password_textfield.dart';
import 'package:myfirst_app/widgets/social_signin.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userNotifier = Provider.of<UserNotifier>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            SizedBox(height: 100),
            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: GoogleFonts.play(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "create an account to continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16),
            CustomTextfield(
              label: "Username",
              textEditingController: usernameController,
            ),

            SizedBox(height: 16),
            CustomTextfield(
              label: "Email",
              textEditingController: emailController,
            ),

            SizedBox(height: 16),
            PasswordTextfield(
              label: "Password",
              textEditingController: passwordController,
            ),

            SizedBox(height: 16),
            PasswordTextfield(
              label: "Confirm Password",
              textEditingController: confirmPasswordController,
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Signup',
              
              onPressed: () {
                 userNotifier.signup(usernameController.text, emailController.text, context);
                //if (usernameController.text != "joy") {
                  //ScaffoldMessenger.of(context).showSnackBar(
                    //SnackBar(content: Text("Username not correct")),
                  //);
                  //return;
                //}
                //if (emailController.text != "joy@gmail.com") {
                  //ScaffoldMessenger.of(
                    //context,
                  //).showSnackBar(SnackBar(content: Text("Incorrect email")));
                //}
                //if (passwordController.text != "1234") {
                  //ScaffoldMessenger.of(
                    //context,
                  //).showSnackBar(SnackBar(content: Text("Incorrect password")));
                  //return;
                  
                //}
                //if(passwordController.text != confirmPasswordController.text) {
                  //ScaffoldMessenger.of(context).showSnackBar(
                    //SnackBar(content: Text("Password does not match with confirm")),
                  //);
                  //return;
                //}
                //Navigator.of(context).pushReplacementNamed("/home");
               
              },
            ),
            SocialSignin(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Text("Already have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: Text("Log in", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
