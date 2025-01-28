import 'package:c152/beforetakeoff.dart';
import 'package:c152/beforetaxi.dart';
import 'package:c152/enginestart.dart';
import 'package:c152/takeoff.dart';
import 'package:c152/taxi.dart';
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
              // Custom Drawer Header
              Container(
                height: 150, // Adjust the height as needed
                decoration: BoxDecoration(
                  color: Colors.blue, // Background color for the header
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                          10.0), // Add padding around the image
                      child: CircleAvatar(
                        radius: 40, // Adjust the size of the circle avatar
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/c152.png', // Path to your image
                            fit: BoxFit.cover,
                            width: 90, // Adjust the width of the image
                            height: 90, // Adjust the height of the image
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16), // Add space between the image and text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'C152',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: 8), // Add space between the two text lines
                        Text(
                          'Checklists',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
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
              DrawerListTile(
                title: 'Taxi Checklist',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TaxiChecklistScreen(), // Link to Before Taxi Checklist
                    ),
                  );
                },
              ),
              DrawerListTile(
                title: 'Before Take-Off Checklist',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BeforeTakeoffChecklistScreen(), // Link to Before Taxi Checklist
                    ),
                  );
                },
              ),
              DrawerListTile(
                title: 'Take-Off Checklist',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TakeoffChecklistScreen(), // Link to Before Taxi Checklist
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CHECKLISTS FIRST',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight
                        .bold), // You can customize the font size here
              ),
              Image.asset(
                'assets/c152.png', // Path to the image in the assets folder
                width: 300, // You can adjust the width as needed
                height: 300, // You can adjust the height as needed
              ),
              Text(
                'SAFETY ALWAYS',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight
                        .bold), // You can customize the font size here
              ),
            ],
          ),
        ),
      ),
    );
  }
}
