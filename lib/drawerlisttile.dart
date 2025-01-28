import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;

  // Constructor
  const DrawerListTile({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor = Colors.blue, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50, // Use a shade of blue for the background
        border: Border.all(
          color: Colors.blue.shade50, // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(7.0), // Rounded corners
      ),
      padding: EdgeInsets.all(5.0), // Inner padding
      margin:
          EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0), // Outer spacing
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            //   fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.zero, // Remove default ListTile padding
      ),
    );
  }
}
