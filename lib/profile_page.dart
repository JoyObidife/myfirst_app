import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings),),
        ],

      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              "assets/profile_pics.jpg",
              width: 100,
              height: 100,
            ),
          ),
          
          Text("Hannah Michael", textAlign: TextAlign.center,),
          Text("hannahmail@gmail.com", textAlign: TextAlign.center,),
            
        ], 
          ),
      
        
      );
    
  }
}