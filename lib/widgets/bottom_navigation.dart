import 'package:flutter/material.dart';
import 'package:myfirst_app/pages/contact_page.dart';
import 'package:myfirst_app/pages/home_page.dart';
import 'package:myfirst_app/pages/profile_page.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexToBeShown = 1;

  var pages = [HomePage(), ContactPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexToBeShown,
        onTap: (value) {
          setState(() {
            indexToBeShown = value;
        
            
          });
 },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Contact", icon: Icon(Icons.call)), 
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
      ),
    );
  }
}
