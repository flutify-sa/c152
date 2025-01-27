import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class BeforeTaxiChecklistScreen extends StatefulWidget {
  const BeforeTaxiChecklistScreen({super.key});

  @override
  BeforeTaxiChecklistScreenState createState() =>
      BeforeTaxiChecklistScreenState();
}

class BeforeTaxiChecklistScreenState extends State<BeforeTaxiChecklistScreen> {
  // List of checklist items and their requirements for Before Taxi
  final List<Map<String, String>> checklistItems = [
    {'item': 'Parking Brake', 'req': 'Ensure parking brake is set.'},
    {
      'item': 'Flight Controls',
      'req': 'Check free movement of flight controls.'
    },
    {
      'item': 'Instruments',
      'req': 'Verify all instruments are functioning properly.'
    },
    {'item': 'Fuel Quantity', 'req': 'Ensure sufficient fuel for the flight.'},
    {
      'item': 'Fuel Selector',
      'req': 'Set fuel selector to BOTH or desired tank.'
    },
    {'item': 'Mixture', 'req': 'Set the mixture to FULL RICH.'},
    {'item': 'Throttle', 'req': 'Set the throttle to 1,000 RPM.'},
    {'item': 'Carburetor Heat', 'req': 'Ensure carburetor heat is OFF.'},
    {'item': 'Ammeter', 'req': 'Check ammeter for proper charging.'},
    {'item': 'Beacon Light', 'req': 'Turn the beacon light ON.'},
    {'item': 'Pitot Heat', 'req': 'Turn pitot heat ON if necessary.'},
    {'item': 'Flaps', 'req': 'Set flaps to takeoff position (if required).'},
    {'item': 'Trim', 'req': 'Set trim for takeoff.'},
    {'item': 'Altimeter', 'req': 'Set altimeter to current airport pressure.'},
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
                : Text('Before Taxi: $completedCount/${checklistItems.length}'),
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
