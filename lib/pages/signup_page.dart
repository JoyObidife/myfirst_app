import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirst_app/widgets/custom_textfield.dart';
import 'package:myfirst_app/widgets/password_textfield.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
         CustomTextfield(label:"Username",),
         CustomTextfield(label: "Email",),
         PasswordTextfield(),
         PasswordTextfield(),
        ],
      ),
    );
  }
}
