import 'package:flutter/material.dart';
import 'package:myfirst_app/pages/login_page.dart';
import 'package:myfirst_app/pages/signup_page.dart';
import 'package:myfirst_app/widgets/bottom_navigation.dart';
import 'package:myfirst_app/pages/home_page.dart';
import 'package:myfirst_app/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save A Life',
      theme: ThemeData(
        
        
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      
      ),
 debugShowCheckedModeBanner: false,
 routes: {
  "/":(context)=> OnbordingPage(),
  "/home": (context)=> BottomNavigation(),
   "/login": (context)=> LoginPage(),
   "/signup":(context)=> SignupPage()
 },
   initialRoute: "/Login",
   //  home: BottomNavigation()
    );
  }
}

