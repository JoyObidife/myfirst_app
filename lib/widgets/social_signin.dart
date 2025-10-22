import 'package:flutter/material.dart';

class SocialSignin extends StatelessWidget {
  const SocialSignin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
              child: Image.asset(
                "assets/linkedin.png",
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
