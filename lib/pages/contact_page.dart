import 'package:flutter/material.dart';
import 'package:myfirst_app/widgets/contact_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts"), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            child: ContactItem(),
          ),
        ],
      ),
    );
  }
}

