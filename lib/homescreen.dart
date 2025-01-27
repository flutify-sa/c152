import 'package:c152/enginestart.dart';
import 'package:flutter/material.dart';
import 'package:c152/preflight.dart'; // Import the Preflight checklist page
import 'package:c152/beforestart.dart'; // Import the Before Start checklist page

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cessna 152 Checklists'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Checklists',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // Preflight Checklist Link
            ListTile(
              title: Text('Preflight Checklist'),
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

            ListTile(
              title: Text('Before Start Checklist'),
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
            ListTile(
              title: Text('Engine Start Checklist'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EngineStartChecklistScreen(), // Link to Before Start Checklist
                  ),
                );
              },
            ), // Additional checklist links can be added here in a similar manner
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Select a checklist from the drawer to start.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
