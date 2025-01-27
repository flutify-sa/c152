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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Row(
          children: [
            Text('Engine Start Checklist'), // Checklist title
            Spacer(),
            allCompleted
                ? Text(
                    'ALL CHECKS COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text('Completed: $completedCount/${checklistItems.length}'),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: checklistItems.length,
        itemBuilder: (context, index) {
          return ChecklistItem(
            item: checklistItems[index]['item']!,
            req: checklistItems[index]['req']!,
            isCompleted: isCompleted[index],
            onPressed: () {
              setState(() {
                isCompleted[index] = !isCompleted[index];
              });
            },
          );
        },
      ),
    );
  }
}
