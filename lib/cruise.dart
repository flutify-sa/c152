import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class CruiseChecklistScreen extends StatefulWidget {
  const CruiseChecklistScreen({super.key});

  @override
  CruiseChecklistScreenState createState() => CruiseChecklistScreenState();
}

class CruiseChecklistScreenState extends State<CruiseChecklistScreen> {
  // List of checklist items and their requirements for Cruise
  final List<Map<String, String>> checklistItems = [
    {'item': 'Mixture', 'req': 'Lean as required for optimal performance.'},
    {'item': 'Power', 'req': 'Adjust for cruise power setting.'},
    {'item': 'Flight instruments', 'req': 'Check all flight instruments.'},
    {'item': 'Fuel', 'req': 'Check fuel balance and quantity.'},
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
                'Cruise Checklist',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            allCompleted
                ? Text(
                    'COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text('Cruise: $completedCount/${checklistItems.length}'),
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
