import 'package:flutter/material.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
       border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        labelText: "Password",
      ),
      obscureText: true,
    );
  }
}


