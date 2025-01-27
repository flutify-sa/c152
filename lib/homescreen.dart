import 'package:c152/beforetaxi.dart';
import 'package:c152/enginestart.dart';
import 'package:flutter/material.dart';
import 'package:c152/preflight.dart';
import 'package:c152/beforestart.dart';
import 'package:c152/drawerlisttile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade100,
            Colors.blue.shade200,
            Colors.blue.shade300,
            Colors.blue.shade400,
            Colors.blue.shade700,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Make Scaffold background transparent
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove shadow
          title: Text('Cessna 152'),
        ),
        drawer: Drawer(
          backgroundColor: Colors.blue.shade100,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Drawer Header
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue, // Change color to match your theme
                ),
                accountName: Text(
                  'C152',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                accountEmail: Text(
                  'Checklists',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/c152.png', fit: BoxFit.cover),
                ),
              ),
              // Preflight Checklist Link
              DrawerListTile(
                title: 'Preflight Checklist',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PreflightScreen(), // Link to Preflight Checklist
                    ),
                  );
                },
              ),
              // Before Start Checklist Link
              DrawerListTile(
                title: 'Before Start Checklist',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BeforeStartChecklistScreen(), // Link to Before Start Checklist
                    ),
                  );
                },
              ),
              // Engine Start Checklist Link
              DrawerListTile(
                title: 'Engine Start Checklist',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const EngineStartChecklistScreen(), // Link to Engine Start Checklist
                    ),
                  );
                },
              ),
              // Before Taxi Checklist Link
              DrawerListTile(
                title: 'Before Taxi Checklist',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BeforeTaxiChecklistScreen(), // Link to Before Taxi Checklist
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Image.asset(
            'assets/c152.png', // Path to the image in the assets folder
            width: 300, // You can adjust the width as needed
            height: 300, // You can adjust the height as needed
          ),
        ),
      ),
    );
  }
}
