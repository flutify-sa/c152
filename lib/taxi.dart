import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class TaxiChecklistScreen extends StatefulWidget {
  const TaxiChecklistScreen({super.key});

  @override
  TaxiChecklistScreenState createState() => TaxiChecklistScreenState();
}

class TaxiChecklistScreenState extends State<TaxiChecklistScreen> {
  // List of checklist items and their requirements for Taxi
  final List<Map<String, String>> checklistItems = [
    {'item': 'Brakes', 'req': 'Test brakes after releasing parking brake.'},
    {
      'item': 'Steering',
      'req': 'Check nose wheel steering for proper response.'
    },
    {
      'item': 'Flight Instruments',
      'req': 'Verify heading indicator and compass alignment.'
    },
    {
      'item': 'Gyro Instruments',
      'req': 'Ensure gyroscopic instruments respond properly.'
    },
    {'item': 'Engine Power', 'req': 'Maintain throttle as required for taxi.'},
    {
      'item': 'Taxi Route Clearance',
      'req': 'Verify clearance and monitor ground communication.'
    },
    {'item': 'Taxi Speed', 'req': 'Maintain a safe taxi speed.'},
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
                'Taxi Checklist',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            allCompleted
                ? Text(
                    'COMPLETED',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                : Text('Taxi: $completedCount/${checklistItems.length}'),
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
