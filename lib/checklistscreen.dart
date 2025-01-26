import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  ChecklistScreenState createState() => ChecklistScreenState();
}

class ChecklistScreenState extends State<ChecklistScreen> {
  // List of checklist items and their reqs
  final List<Map<String, String>> checklistItems = [
    {'item': 'Parking Brake', 'req': 'Set the parking brake.'},
    {'item': 'Master Switch', 'req': 'Turn the MASTER SWITCH to ON.'},
    {'item': 'Fuel Selector', 'req': 'Set to BOTH or desired tank.'},
    {'item': 'Fuel Quantity', 'req': 'Check fuel levels in both tanks.'},
    {'item': 'Mixture', 'req': 'Set to FULL RICH.'},
    {'item': 'Throttle', 'req': 'Set to 1/4 INCH OPEN.'},
    {'item': 'Carburetor Heat', 'req': 'Set to OFF.'},
    {'item': 'Primer', 'req': 'Locked (or prime if cold).'},
    {'item': 'Avionics and Electrical Equipment', 'req': 'Ensure all are OFF.'},
    {'item': 'Beacon Light', 'req': 'Turn ON.'},
    {'item': 'Area Clear', 'req': 'Ensure area is clear of obstacles.'},
    {'item': 'Doors and Windows', 'req': 'Ensure securely closed.'},
    {'item': 'Seatbelts and Harnesses', 'req': 'Ensure all are fastened.'},
    {'item': 'Flight Controls', 'req': 'Check for free movement.'},
    {'item': 'Instruments', 'req': 'Check for normal readings.'},
    {'item': 'Ignition', 'req': 'Turn to START.'},
    {'item': 'Oil Pressure', 'req': 'Monitor for normal range.'},
    {'item': 'Ammeter', 'req': 'Check for charging.'},
    {'item': 'Engine Instruments', 'req': 'Verify all in green.'},
    {'item': 'Avionics Master', 'req': 'Turn ON and configure.'},
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
            Text('Cessna 152 Pre-Start Checklist'), // Original title
            Spacer(), // Pushes the next widget to the right
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
