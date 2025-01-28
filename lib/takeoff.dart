import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class TakeoffChecklistScreen extends StatefulWidget {
  const TakeoffChecklistScreen({super.key});

  @override
  TakeoffChecklistScreenState createState() => TakeoffChecklistScreenState();
}

class TakeoffChecklistScreenState extends State<TakeoffChecklistScreen> {
  // List of checklist items and their requirements for Takeoff
  final List<Map<String, String>> checklistItems = [
    {'item': 'Mixture', 'req': 'Set to full rich.'},
    {'item': 'Throttle', 'req': 'Full open for takeoff power.'},
    {'item': 'Engine Gauges', 'req': 'Check for green arc indications.'},
    {'item': 'Airspeed', 'req': 'Verify alive and increasing.'},
    {'item': 'Elevator Control', 'req': 'Rotate at the recommended speed.'},
    {'item': 'Flaps', 'req': 'Verify takeoff position (if used).'},
    {'item': 'Directional Control', 'req': 'Maintain centerline with rudder.'},
    {
      'item': 'Climb Speed',
      'req': 'Establish and maintain initial climb speed.'
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
                '',
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
                : Text('Takeoff: $completedCount/${checklistItems.length}'),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
