import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class ApproachChecklistScreen extends StatefulWidget {
  const ApproachChecklistScreen({super.key});

  @override
  ApproachChecklistScreenState createState() => ApproachChecklistScreenState();
}

class ApproachChecklistScreenState extends State<ApproachChecklistScreen> {
  // List of checklist items and their requirements for Approach
  final List<Map<String, String>> checklistItems = [
    {'item': 'Altimeter', 'req': 'Set to local pressure.'},
    {'item': 'Speed', 'req': 'Adjust for approach speed.'},
    {'item': 'Flaps', 'req': 'Extend as required for approach.'},
    {'item': 'Landing Gear', 'req': 'Check down and locked.'},
    {'item': 'Lights', 'req': 'Turn on landing lights if not already on.'},
    {'item': 'Autopilot', 'req': 'Disconnect if required for manual landing.'},
    {'item': 'Approach Plates', 'req': 'Review approach procedures.'},
    {'item': 'Weather', 'req': 'Check updated METAR/TAF for destination.'},
    {'item': 'ATIS', 'req': 'Confirm updated ATIS information.'},
    {'item': 'Briefing', 'req': 'Complete approach and landing briefing.'},
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
                'Approach Checklist',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            allCompleted
                ? Text(
                    'COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text('Approach: $completedCount/${checklistItems.length}'),
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
