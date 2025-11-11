import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    return ListView(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: GoogleMap(
            //onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(4, 4),
              zoom: 2,
            ),
            markers: {
              Marker(
                markerId: MarkerId("My house"),
                position: LatLng(4, 9),
                infoWindow: InfoWindow(
                  title: "Chioma house",
                  snippet: "come and help me",
                ),
              ),
            },
          ),
        ),
      ],
    );
  }
}
