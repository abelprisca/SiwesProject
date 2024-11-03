// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class StartSiwesAttendace extends StatefulWidget {
  const StartSiwesAttendace({super.key});

  @override
  _SiwesState createState() => _SiwesState();
}

class _SiwesState extends State<StartSiwesAttendace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIWES'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5, // Reduced width
          padding: const EdgeInsets.all(16.0), // Added padding
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFF38437C)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              minimumSize: MaterialStateProperty.all(const Size(100, 30)), // Reduced button size
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/studentattendance');
            },
            child: Text('Start SIWES Attendance ', style: TextStyle(fontSize: 12, color: Colors.white)), // Reduced text size
          ),
        ),
      ),
    );
  }
}

