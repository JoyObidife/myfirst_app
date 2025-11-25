import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfirst_app/firebase_options.dart';
import 'package:myfirst_app/pages/forgot_password_page.dart';
import 'package:myfirst_app/pages/login_page.dart';
import 'package:myfirst_app/pages/signup_page.dart';
import 'package:myfirst_app/provider/user_notifier.dart';
import 'package:myfirst_app/widgets/bottom_navigation.dart';
import 'package:myfirst_app/pages/onboarding_page.dart';
import 'package:provider/provider.dart';
import 'package:myfirst_app/pages/personal _information.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GoogleSignIn.instance.initialize(
    clientId: Platform.isAndroid
     ? "1072276128369-p18g278kpfogkgulhq2o8ij3u1jlvfvu.apps.googleusercontent.com"
    : "1072276128369-2c4fu1biu8u401bs4oaeltghucumk8j9.apps.googleusercontent.com",

    serverClientId: "1072276128369-sjpksbenp8gvtmd7akesfv527o51s35k.apps.googleusercontent.com",
    );
      
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This Widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserNotifier(),
      child: MaterialApp(
        title: 'Save A Life',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/o": (context) => OnbordingPage(),
          "/home": (context) => BottomNavigation(),
          "/login": (context) => LoginPage(),
          "/signup": (context) => SignupPage(),
          "/forgot": (context) => ForgotPasswordPage(),
          "/personal information":(context) => PersonalInformation(),
        },
        initialRoute: "/o",

        //  home: BottomNavigation()
      ),
    );
  }
}
