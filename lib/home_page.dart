import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediCall"),
        centerTitle: true,
      
          actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Icon(Icons.search),
          ),
        ],
        leading: Icon(Icons.menu),
      ),
        body: ListView(
      children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search hospital or address",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)
                    
                    ),
                  ),
                ),
              ),
          // Widget for showing image
          SizedBox(
            child: Image.asset(
              "assets/map.jpg",
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.7,
              fit: BoxFit.cover,
            ),
          ),
          
            ],
          
          ),
        );
      
      
      
  }
}