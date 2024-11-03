import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final TextEditingController _reportController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _matrixNumberController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  final List<String> _reports = []; // List to store multiple reports

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo at the center
            Center(
              child: Image.asset('images/siweslogo.png', height: 100), // Replace with your logo path
            ),
            SizedBox(height: 20),

            // Title
            Text(
              'Student Report',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Accent color
              ),
            ),
            SizedBox(height: 30), // Increased spacing

            // Combined input fields for student details and report
            Column(
              children: [
                // Name Input Field
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.black), // Label color set to black
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: Colors.black54), // Hint text color set to black
                  ),
                  style: TextStyle(color: Colors.black), // Change text color to black
                ),
                SizedBox(height: 20), // Increased space between input fields

                // Matrix Number Input Field
                TextField(
                  controller: _matrixNumberController,
                  decoration: InputDecoration(
                    labelText: 'Matrix Number',
                    labelStyle: TextStyle(color: Colors.black), // Label color set to black
                    border: OutlineInputBorder(),
                    hintText: 'Enter your matrix number',
                    hintStyle: TextStyle(color: Colors.black54), // Hint text color set to black
                  ),
                  style: TextStyle(color: Colors.black), // Change text color to black
                ),
                SizedBox(height: 20), // Increased space between input fields

                // Department Input Field
                TextField(
                  controller: _departmentController,
                  decoration: InputDecoration(
                    labelText: 'Department',
                    labelStyle: TextStyle(color: Colors.black), // Label color set to black
                    border: OutlineInputBorder(),
                    hintText: 'Enter your department',
                    hintStyle: TextStyle(color: Colors.black54), // Hint text color set to black
                  ),
                  style: TextStyle(color: Colors.black), // Change text color to black
                ),
                SizedBox(height: 20), // Increased space between input fields

                // Input field for report
                TextField(
                  controller: _reportController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type your Report',
                    hintStyle:
                        TextStyle(color: Colors.black54), // Hint text color set to black
                  ),
                  maxLines: 5,
                  style:
                      TextStyle(color:
                          Colors.black), // Change report text color to black
                ),
              ],
            ),
            SizedBox(height: 30), // Increased spacing before button

            // Create Report Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String name = _nameController.text;
                  String matrixNumber = _matrixNumberController.text;
                  String department = _departmentController.text;
                  String reportContent = _reportController.text;

                  // Include student details in the report text
                  String newReport = "Name: $name\n"
                      "Matrix Number: $matrixNumber\n"
                      "Department: $department\n\n"
                      "Report:\n$reportContent";

                  // Add the new report to the list of reports
                  _reports.add(newReport);

                  // Clear the input fields after adding the report
                  _nameController.clear();
                  _matrixNumberController.clear();
                  _departmentController.clear();
                  _reportController.clear();
                });
              },
              style:
                  ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF174359), // Button color set to #174359
                      shape:
                          RoundedRectangleBorder(borderRadius:
                              BorderRadius.circular(2))),
              child:
                  Text('Create Report', style:
                      TextStyle(color:
                          Colors.white)),
            ),
            SizedBox(height:
                20),

            // Display all reports below the button with a border and custom background color for reports
            if (_reports.isNotEmpty) ...[
              Column(
                children:
                    _reports.map((report) => Container(
                      padding:
                          const EdgeInsets.all(8.0),
                      margin:
                          const EdgeInsets.only(bottom: 10.0), // Space between reports
                      decoration:
                          BoxDecoration(border:
                              Border.all(color:
                                  Colors.teal),
                              borderRadius:
                                  BorderRadius.circular(12.0)),
                      child:
                          Padding(padding:
                              const EdgeInsets.symmetric(vertical:
                                  10.0),
                              child:
                                  Text(report, style:
                                      TextStyle(fontSize:
                                          16))),
                    )).toList(),
              )
            ],
          ],
        ),
      ),
    );
  }
}