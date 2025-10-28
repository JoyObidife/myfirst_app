import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myfirst_app/widgets/custom_button.dart';
import 'package:myfirst_app/widgets/custom_textfield.dart';
import 'package:otp_input/otp_input.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool showOtp = false;
  late Timer timer;
  int seconds = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the email address you will like to receive your recovery pin",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            CustomTextfield(
              label: "Email Address",

              textEditingController: TextEditingController(),
            ),

            showOtp
                ? _buildOtpView()
                : Column(
                    children: [
                      CustomButton(
                        onPressed: () {
                          setState(() {
                            showOtp = true;
                          });
                          // set re- request OTP timer
                          timer = Timer.periodic(Duration(seconds: 3), (timer) {
                            print("ticked");
                            if(seconds <= 1){
                              timer.cancel();
                            }
                            setState(() {
                              seconds --;
                            });
                            

                          });
                        
                        },
                        text: "Get OTP",
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpView() {
    return Column(
      spacing: 8,
      children: [
        Text("Check your Email Address and Enter the otp you received"),
        OtpInputField(
          otpInputFieldCount: 5,
          fieldStyle: OtpFieldStyle.circle,
          onOtpEntered: (otp) {
            print('Entered OTP: $otp');
            if (otp == "12345") {
              Navigator.of(context).pushNamed("/home");
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Invaid OPT")));
            }
          },
        ),
        // checkm if seconds == 0, show the user a button for required again.
       Text("$seconds seconds to request again"),
      ],
    );
  }
}
