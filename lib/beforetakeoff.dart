import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class BeforeTakeoffChecklistScreen extends StatefulWidget {
  const BeforeTakeoffChecklistScreen({super.key});

  @override
  BeforeTakeoffChecklistScreenState createState() =>
      BeforeTakeoffChecklistScreenState();
}

class BeforeTakeoffChecklistScreenState
    extends State<BeforeTakeoffChecklistScreen> {
  // List of checklist items and their requirements for Before Takeoff
  final List<Map<String, String>> checklistItems = [
    {'item': 'Flight Controls', 'req': 'Check for free and correct movement.'},
    {'item': 'Flight Instruments', 'req': 'Set and verify correct settings.'},
    {'item': 'Fuel Selector', 'req': 'Ensure set to BOTH.'},
    {'item': 'Mixture', 'req': 'Set to FULL RICH.'},
    {'item': 'Trim', 'req': 'Set for takeoff.'},
    {'item': 'Flaps', 'req': 'Set for takeoff if required.'},
    {'item': 'Throttle', 'req': 'Set to 1700 RPM for engine run-up.'},
    {'item': 'Magnetos', 'req': 'Check (Drop should not exceed 125 RPM).'},
    {'item': 'Carburetor Heat', 'req': 'Check and set as required.'},
    {'item': 'Engine Gauges', 'req': 'Check for proper indications.'},
    {'item': 'Ammeter and Suction', 'req': 'Verify proper operation.'},
    {'item': 'Throttle Idle', 'req': 'Check for smooth operation.'},
    {'item': 'Mixture', 'req': 'Lean for altitude if required.'},
    {
      'item': 'Radio and Navigation Equipment',
      'req': 'Set and verify frequencies.'
    },
    {'item': 'Takeoff Briefing', 'req': 'Complete takeoff briefing.'},
    {'item': 'Doors and Windows', 'req': 'Ensure secure.'},
    {'item': 'Transponder', 'req': 'Set to ALT.'},
    {
      'item': 'Lights',
      'req': 'Set as required (beacon, strobe, landing light).'
    },
    {'item': 'Parking Brake', 'req': 'Release before taxi to runway.'},
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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                '',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            allCompleted
                ? Text(
                    'COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text(
                    'Before Takeoff: $completedCount/${checklistItems.length}'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: checklistItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
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
