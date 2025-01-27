import 'package:c152/checklistitem.dart';
import 'package:flutter/material.dart';

class PreflightScreen extends StatefulWidget {
  const PreflightScreen({super.key});

  @override
  PreflightScreenState createState() => PreflightScreenState();
}

class PreflightScreenState extends State<PreflightScreen> {
  // List of checklist items and their reqs for Preflight
  final List<Map<String, String>> checklistItems = [
    {
      'item': 'Aircraft Documents',
      'req':
          'Check the aircraft registration, airworthiness certificate, and insurance.'
    },
    {
      'item': 'External Inspection',
      'req': 'Check for any visible damage, leaks, or missing parts.'
    },
    {
      'item': 'Wings',
      'req':
          'Inspect wing surfaces for damage, check fuel tank caps, and ensure fuel levels are sufficient.'
    },
    {
      'item': 'Control Surfaces',
      'req':
          'Check the ailerons, elevators, and rudder for freedom of movement and condition.'
    },
    {
      'item': 'Empennage',
      'req':
          'Ensure the horizontal stabilizer, vertical stabilizer, and control surfaces are intact and undamaged.'
    },
    {
      'item': 'Landing Gear',
      'req':
          'Inspect the tires for wear and proper inflation, check the struts and the wheel wells.'
    },
    {
      'item': 'Pitot Tube',
      'req': 'Check the pitot tube for obstructions and clear any debris.'
    },
    {
      'item': 'Fuel System',
      'req':
          'Ensure the fuel selector valve is set to BOTH or desired tank. Check fuel quantity and condition.'
    },
    {
      'item': 'Oil',
      'req':
          'Check oil level, ensure it is within operating limits (approximately 4-6 quarts).'
    },
    {
      'item': 'Flaps',
      'req': 'Check the flap operation by moving them up and down.'
    },
    {
      'item': 'Nose Wheel',
      'req': 'Check the nosewheel for condition and proper inflation.'
    },
    {
      'item': 'Control Lock',
      'req': 'Ensure that the control lock is removed before flight.'
    },
    {
      'item': 'Cockpit Inspection',
      'req':
          'Check the interior, ensure seatbelts and harnesses are functional and secured.'
    },
    {
      'item': 'Brakes',
      'req': 'Test brakes for proper operation before flight.'
    },
    {
      'item': 'Avionics',
      'req': 'Ensure all avionics are functioning and that no fuses are blown.'
    },
    {
      'item': 'Flight Instruments',
      'req':
          'Check the altimeter, airspeed indicator, compass, and other instruments for accuracy.'
    },
    {
      'item': 'Electrical System',
      'req': 'Test the master switch and check the battery charge level.'
    },
    {
      'item': 'Lights',
      'req': 'Test all exterior and interior lights for proper operation.'
    },
    {
      'item': 'Baggage Compartment',
      'req':
          'Check that the baggage compartment is secure and within weight limits.'
    },
    {
      'item': 'Emergency Equipment',
      'req':
          'Ensure the aircraft has the required emergency equipment, such as fire extinguishers and first aid kits.'
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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
                'Cessna 152 Preflight Checklist'), // Changed title to Preflight
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
