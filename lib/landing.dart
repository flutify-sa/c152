import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class LandingChecklistScreen extends StatefulWidget {
  const LandingChecklistScreen({super.key});

  @override
  LandingChecklistScreenState createState() => LandingChecklistScreenState();
}

class LandingChecklistScreenState extends State<LandingChecklistScreen> {
  // List of checklist items and their requirements for Landing
  final List<Map<String, String>> checklistItems = [
    {'item': 'Altimeter', 'req': 'Set to local pressure.'},
    {'item': 'Speed', 'req': 'Adjust for landing speed.'},
    {'item': 'Flaps', 'req': 'Fully extended as required for landing.'},
    {'item': 'Landing Gear', 'req': 'Ensure gear is down and locked.'},
    {'item': 'Lights', 'req': 'Turn on landing lights if not already on.'},
    {'item': 'Briefing', 'req': 'Complete landing briefing.'},
    {'item': 'Autopilot', 'req': 'Disconnect if required.'},
    {
      'item': 'Final Approach',
      'req': 'Check final approach path and alignment.'
    },
    {'item': 'Weather', 'req': 'Confirm current conditions at the runway.'},
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
                'Landing Checklist',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            allCompleted
                ? Text(
                    'COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text('Landing: $completedCount/${checklistItems.length}'),
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
