import 'package:flutter/material.dart';
import 'package:myfirst_app/widgets/custom_button.dart';
import 'package:myfirst_app/widgets/custom_textfield.dart';
import 'package:myfirst_app/pages/personal _information.dart';
import 'package:myfirst_app/widgets/password_textfield.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
       centerTitle: true
       ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Icon(
                      Icons.person_2,
                      color: Colors.grey.shade600,
                      size: 70,
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Icon(Icons.edit, size: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                spacing: 14,
                children: [
                  SizedBox(height: 18),

                   CustomTextfield(label: "Username"),
                    CustomTextfield(label: "Email"),
                    PasswordTextfield(label: "Password"),
                    PasswordTextfield(label: "Confirm Password"),
                    
                  SizedBox(height: 24),
                  CustomButton(text: "Update Profile", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}