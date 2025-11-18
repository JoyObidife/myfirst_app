import 'package:flutter/material.dart';
import 'package:myfirst_app/provider/user_notifier.dart';
import 'package:provider/provider.dart';

class SocialSignin extends StatelessWidget {
  const SocialSignin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     var userP = Provider.of<UserNotifier>(context);
    return Column(
      children: [
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Divider()),
            Text("Sign in with"),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/facebook.png",
                width: 50,
                height: 50,
              ),
            ),
            InkWell(
              onTap: () {
                userP.signInWithGoogle(context);
              },
              child: Image.asset(
                "assets/icons8-google-color/google.png",
                width: 50,
                height: 50,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/twitter.png",
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
         
      ],
    );
  }
}
