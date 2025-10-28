import 'package:flutter/material.dart';
import 'package:myfirst_app/widgets/contact_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "Map"),
                Tab(text: "List"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Widget for showing map image
                  _buildMapView(),
                  // widget for showing ListView
                  _buildListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      children: [
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
      ],
    );
  }

  Widget _buildMapView() {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Image.asset(
        "assets/map.jpg",
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 1,
        fit: BoxFit.cover,
      ),
    );
  }
}
