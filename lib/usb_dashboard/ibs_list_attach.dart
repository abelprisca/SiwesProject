import 'package:flutter/material.dart';

class IbsListAttach extends StatelessWidget {
  const IbsListAttach({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Logo at the center
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset(
                'images/siweslogo.png',
                height: 100,
                width: 100,
              ),
            ),
          ),
          // Title text
          Text(
            'LIST OF STUDENT ATTACHED',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // Scrollable list of students
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                studentItem('Priscilla Abel', 'SFE/22U/3021', '2024-10-20'),
                studentItem('John Doe', 'SFE/22U/3022', '2024-10-21'),
                studentItem('Jane Smith', 'SFE/22U/3023', '2024-10-22'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for each student item
  Widget studentItem(String name, String matricNo, String date) {
    return Card(
      elevation: 4, // Adds shadow effect
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Student name and matric number
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  matricNo,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            // Date
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

