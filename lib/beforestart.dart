import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class BeforeStartChecklistScreen extends StatefulWidget {
  const BeforeStartChecklistScreen({super.key});

  @override
  BeforeStartChecklistScreenState createState() =>
      BeforeStartChecklistScreenState();
}

class BeforeStartChecklistScreenState
    extends State<BeforeStartChecklistScreen> {
  // List of checklist items and their reqs for Before Start
  final List<Map<String, String>> checklistItems = [
    {'item': 'Parking Brake', 'req': 'Set the parking brake to ON.'},
    {'item': 'Master Switch', 'req': 'Turn the MASTER SWITCH to ON.'},
    {'item': 'Fuel Selector', 'req': 'Set to BOTH or desired tank.'},
    {'item': 'Fuel Quantity', 'req': 'Check fuel levels in both tanks.'},
    {'item': 'Mixture', 'req': 'Set the mixture to FULL RICH.'},
    {'item': 'Throttle', 'req': 'Set the throttle to 1/4 INCH OPEN.'},
    {'item': 'Carburetor Heat', 'req': 'Set the carburetor heat to OFF.'},
    {
      'item': 'Primer',
      'req': 'Ensure primer is locked (or prime if cold weather).'
    },
    {
      'item': 'Avionics and Electrical Equipment',
      'req': 'Ensure all avionics and electrical equipment are OFF.'
    },
    {'item': 'Beacon Light', 'req': 'Turn the beacon light ON.'},
    {
      'item': 'Area Clear',
      'req': 'Ensure area is clear of obstacles and personnel.'
    },
    {
      'item': 'Doors and Windows',
      'req': 'Ensure that all doors and windows are securely closed.'
    },
    {
      'item': 'Seatbelts and Harnesses',
      'req': 'Ensure all seatbelts and harnesses are fastened.'
    },
    {
      'item': 'Flight Controls',
      'req': 'Check for free movement of flight controls.'
    },
    {
      'item': 'Instruments',
      'req': 'Check all instruments for normal readings.'
    },
    {'item': 'Ignition', 'req': 'Turn the ignition key to the START position.'},
    {
      'item': 'Oil Pressure',
      'req': 'Monitor oil pressure to ensure it is in the normal range.'
    },
    {'item': 'Ammeter', 'req': 'Check that the ammeter is charging properly.'},
    {
      'item': 'Engine Instruments',
      'req': 'Verify that all engine instruments are in the green.'
    },
    {
      'item': 'Avionics Master',
      'req': 'Turn ON and configure the avionics master.'
    },
  ];

  // Track the state of each checklist item
  List<bool> isCompleted = [];

  @override
  void initState() {
    super.initState();
    // Initialize all items as not completed
    isCompleted = List<bool>.filled(checklistItems.length, false);
  }

  // Calculate the number of completed checks
  int get completedCount => isCompleted.where((completed) => completed).length;

  // Check if all items are completed
  bool get allCompleted => completedCount == checklistItems.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50, // Match the background color
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                '', // Changed title to Before Taxi
                overflow: TextOverflow
                    .ellipsis, // Handles overflow if text is too long
              ),
            ),
            allCompleted
                ? Text(
                    'COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text(
                    'Before Start: $completedCount/${checklistItems.length}'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the body in SingleChildScrollView to prevent overflow
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Prevent internal scrolling
              itemCount: checklistItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0), // Add vertical spacing
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // White background
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2), // Add a subtle shadow
                        ),
                      ],
                    ),
                    child: ChecklistItem(
                      item: checklistItems[index]['item']!,
                      req: checklistItems[index]['req']!,
                      isCompleted: isCompleted[index],
                      onPressed: () {
                        setState(() {
                          isCompleted[index] = !isCompleted[index];
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
