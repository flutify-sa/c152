import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class PostLandingChecklistScreen extends StatefulWidget {
  const PostLandingChecklistScreen({super.key});

  @override
  PostLandingChecklistScreenState createState() =>
      PostLandingChecklistScreenState();
}

class PostLandingChecklistScreenState
    extends State<PostLandingChecklistScreen> {
  // List of checklist items and their requirements for Post-Landing
  final List<Map<String, String>> checklistItems = [
    {'item': 'Flaps', 'req': 'Retract after landing as required.'},
    {'item': 'Speed', 'req': 'Adjust to taxi speed.'},
    {'item': 'Landing Lights', 'req': 'Turn off when no longer needed.'},
    {'item': 'Transponder', 'req': 'Set to standby or off.'},
    {'item': 'Brakes', 'req': 'Check and ensure proper operation.'},
    {'item': 'Engines', 'req': 'Monitor engine temperatures and pressures.'},
    {'item': 'Parking Brake', 'req': 'Set as required.'},
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
                'Post-Landing Checklist',
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
                    'Post-Landing: $completedCount/${checklistItems.length}'),
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
