import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    
    super.key,
    required this.label,
    required this.textEditingController,
  });
  final String label;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController ,
      // decoration allows you to style and customize the appearance of the input box
      decoration: InputDecoration(
        // border draws a visible rectangular border around your text field-just like a form box.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        labelText: label,
      ),
    );
  }
}

