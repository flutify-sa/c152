import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class ShutdownChecklistScreen extends StatefulWidget {
  const ShutdownChecklistScreen({super.key});

  @override
  ShutdownChecklistScreenState createState() => ShutdownChecklistScreenState();
}

class ShutdownChecklistScreenState extends State<ShutdownChecklistScreen> {
  // List of checklist items and their requirements for Shutdown
  final List<Map<String, String>> checklistItems = [
    {'item': 'Engines', 'req': 'Shut down as required.'},
    {'item': 'Avionics', 'req': 'Turn off.'},
    {'item': 'Fuel', 'req': 'Switch off or set to appropriate position.'},
    {'item': 'Battery', 'req': 'Turn off.'},
    {
      'item': 'Parking Brake',
      'req': 'Set to ensure aircraft stays stationary.'
    },
    {'item': 'Cabin', 'req': 'Secure items and ensure the cockpit is clean.'},
    {'item': 'Lights', 'req': 'Turn off all unnecessary lights.'},
    {'item': 'Control Lock', 'req': 'Install as required.'},
    {'item': 'Flight Log', 'req': 'Complete and sign flight log.'},
    {
      'item': 'Departure Briefing',
      'req': 'Ensure all required reports and debriefs are completed.'
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
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Shutdown Checklist',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            allCompleted
                ? Text(
                    'COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text('Shutdown: $completedCount/${checklistItems.length}'),
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
