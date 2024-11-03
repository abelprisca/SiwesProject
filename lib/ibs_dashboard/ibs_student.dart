import 'package:flutter/material.dart';

class IBSSupervisedStudentsScreen extends StatelessWidget {
  // Sample list of students
  final List<IBSStudent> students = [
    IBSStudent('John Doe', '123456', 'Computer Science', 'XYZ Tech'),
    IBSStudent('Jane Smith', '654321', 'Information Systems', 'ABC Corp'),
    IBSStudent('Alice Johnson', '789012', 'Software Engineering', 'Tech Innovations'),
    // Add more students as needed
  ];

  IBSSupervisedStudentsScreen({Key? key}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding for the ListView
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(), // Make the ListView always scrollable
          itemCount: students.length,
          itemBuilder: (context, index) {
            return IBSStudentCard(student: students[index]);
          },
        ),
      ),
    );
  }
}

class IBSStudent {
  final String name;
  final String matrixNumber;
  final String department;
  final String siwesLocation;

  IBSStudent(this.name, this.matrixNumber, this.department, this.siwesLocation);
}

class IBSStudentCard extends StatelessWidget {
  final IBSStudent student;

  const IBSStudentCard({Key? key, required this.student}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the Card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              student.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Matrix Number: ${student.matrixNumber}',
              style: const TextStyle(color: Colors.black54),
            ),
            Text(
              'Department: ${student.department}',
              style: const TextStyle(color: Colors.black54),
            ),
            Text(
              'SIWES Location: ${student.siwesLocation}',
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
