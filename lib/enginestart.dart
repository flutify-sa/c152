import 'package:flutter/material.dart';
import 'package:c152/checklistitem.dart'; // Import your checklist item widget

class EngineStartChecklistScreen extends StatefulWidget {
  const EngineStartChecklistScreen({super.key});

  @override
  EngineStartChecklistScreenState createState() =>
      EngineStartChecklistScreenState();
}

class EngineStartChecklistScreenState
    extends State<EngineStartChecklistScreen> {
  // List of checklist items and their requirements for engine start
  final List<Map<String, String>> checklistItems = [
    {'item': 'Ignition Switch', 'req': 'Turn to start (hold for 3-5 seconds).'},
    {'item': 'Oil Pressure', 'req': 'Verify oil pressure in the green range.'},
    {'item': 'Ammeter', 'req': 'Check that the ammeter is charging.'},
    {
      'item': 'Throttle',
      'req': 'Set to idle or 1,000 RPM (depending on aircraft).'
    },
    {'item': 'Mixture', 'req': 'Set to full rich.'},
    {'item': 'Carburetor Heat', 'req': 'Set to OFF (or as required).'},
    {'item': 'Master Switch', 'req': 'Ensure it remains ON.'},
    {'item': 'Fuel Shutoff Valve', 'req': 'Ensure it is in the ON position.'},
    {'item': 'Fuel Selector Valve', 'req': 'Set to BOTH or desired tank.'},
    {'item': 'Parking Brake', 'req': 'Ensure it is set.'},
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
                    'Engine Start: $completedCount/${checklistItems.length}'),
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
