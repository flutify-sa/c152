import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class ClimbChecklistScreen extends StatefulWidget {
  const ClimbChecklistScreen({super.key});

  @override
  ClimbChecklistScreenState createState() => ClimbChecklistScreenState();
}

class ClimbChecklistScreenState extends State<ClimbChecklistScreen> {
  // List of checklist items and their requirements for Climb
  final List<Map<String, String>> checklistItems = [
    {'item': 'Flaps', 'req': 'Ensure flaps are fully retracted.'},
    {'item': 'Throttle', 'req': 'Set throttle to full power as required.'},
    {'item': 'Mixture', 'req': 'Adjust mixture as necessary for altitude.'},
    {'item': 'Instruments', 'req': 'Monitor engine and flight instruments.'},
    {'item': 'Airspeed', 'req': 'Maintain recommended climb speed.'},
    {'item': 'Heading', 'req': 'Confirm and maintain desired heading.'},
    {'item': 'Altimeter', 'req': 'Cross-check altitude during climb.'},
    {'item': 'Lights', 'req': 'Adjust lights as necessary.'},
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
                'Climb Checklist',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            allCompleted
                ? Text(
                    'COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text('Climb: $completedCount/${checklistItems.length}'),
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
