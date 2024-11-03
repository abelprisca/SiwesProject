import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // Create lists for attendance and verification times for 24 weeks
  List<List<bool>> attendance =
      List.generate(24, (index) => List.generate(6, (i) => false));
  List<List<String?>> verificationTimes =
      List.generate(24, (index) => List.generate(6, (i) => null));

  // Colors for send buttons
  List<Color> sendButtonColors = List.generate(24, (index) => Colors.blue);

  void toggleAttendance(int week, int day) {
    setState(() {
      attendance[week - 1][day] = !attendance[week - 1][day];
    });
  }

  void verifyAttendance(int week, int day) {
    setState(() {
      String currentTime = getCurrentDateTime();
      verificationTimes[week - 1][day] = currentTime;
    });
  }

  String getCurrentDateTime() {
    return DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  }

  void sendAttendance(int week) {
    setState(() {
      sendButtonColors[week - 1] = Colors.green;
    });

    // Logic to send attendance data

    // Reset button color after a delay
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        sendButtonColors[week - 1] = Colors.blue; // Reset to original color
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Attendance data for Week $week sent!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Student Details
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/student_image.jpg'), // Replace with your image path
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Priscilla Abel',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('SFE/22U/3021', style: TextStyle(fontSize: 14)),
                      Text('Software Engineering',
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Attendance Section
              Text('Attendance',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),

              // Build attendance for each week from Week 1 to Week 24
              for (int week = 1; week <= 24; week++)
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20.0), // Space between weeks
                  child: buildWeekAttendance(week, attendance[week - 1],
                      verificationTimes[week - 1], sendButtonColors[week - 1]),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWeekAttendance(int week, List<bool> attendanceList,
      List<String?> verificationTimes, Color sendButtonColor) {
    return Container(
      padding:
          EdgeInsets.all(16), // Increased padding for better spacing from edges
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF9E4E4), // Background color for the week container
        border: Border.all(
            color: Colors
                .transparent), // Transparent border for inner shadow effect
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(5, 5),
            blurRadius: 10,
            spreadRadius: -5,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            offset: Offset(-5, -5),
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            // Centering the title
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Vertical padding for spacing
              child: Text('Week $week',
                  style: TextStyle(
                      fontSize: 18)), // Title centered with larger font size
            ),
          ),
          ...List.generate(6, (index) {
            Color bgColor = (index % 2 == 0)
                ? Color(0xFF755B5B) // Monday, Wednesday, Friday
                : Color(0xFFB14747); // Tuesday, Thursday, Saturday

            return Column(
              children: [
                SizedBox(height: 8), // Spacing between buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              (index % 2 == 0) ? bgColor : Color(0xFFB14747),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        onPressed: () => toggleAttendance(week, index),
                        child: Text(
                            [
                              'Monday',
                              'Tuesday',
                              'Wednesday',
                              'Thursday',
                              'Friday',
                              'Saturday'
                            ][index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10)), // Font size set to small
                      ),
                    ),
                    SizedBox(
                        width: 8), // Spacing between button and verify button
                    ElevatedButton(
                      onPressed: () => verifyAttendance(week, index),
                      child: Text('Verify',
                          style: TextStyle(
                              fontSize:
                                  10)), // Small font size for Verify button
                    ),
                  ],
                ),
                if (verificationTimes[index] != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text('Verified at ${verificationTimes[index]}',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors
                                .green)), // Small font size for time display
                  ),
              ],
            );
          }),
          SizedBox(height: 12), // Spacing before Send button

          // Centered Send Button
          Center(
            child: ElevatedButton(
              onPressed: () => sendAttendance(week),
              style: ElevatedButton.styleFrom(
                  backgroundColor: sendButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(2))), // Set border radius to
              //2 for Send button
              child: Text('Send',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors
                          .white)), // Font size for Send button and text color set to white
            ),
          ),
        ],
      ),
    );
  }
}
