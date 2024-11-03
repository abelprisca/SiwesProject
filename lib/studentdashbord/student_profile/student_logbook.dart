import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(LogbookApp());
}

class LogbookApp extends StatelessWidget {
  const LogbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Logbook',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LogbookHome(),
    );
  }
}

class LogbookHome extends StatefulWidget {
  const LogbookHome({super.key});

  @override
  _LogbookHomeState createState() => _LogbookHomeState();
}

class _LogbookHomeState extends State<LogbookHome> {
  final List<String> weeks = List.generate(24, (index) => 'Week ${index + 1}');
  final List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  List<String> weeklyDescriptions = List.filled(24, '');
  List<List<String>> dailyLogs = List.generate(24, (_) => List.filled(6, ''));
  List<File?> images = List.filled(24, null);

  String monthlySummary = '';
  String monthlySignDateTime = '';

  // Approval status
  List<bool> industrialApproved = List.filled(24, false);
  List<bool> universityApproved = List.filled(24, false);
  List<bool> signedByStudent = List.filled(24, false);
  List<List<bool>> savedLogs = List.generate(24, (_) => List.filled(6, false));

  void saveLog(int weekIndex, int dayIndex) {
    setState(() {
      dailyLogs[weekIndex][dayIndex] += '\n${DateTime.now().toLocal()} - ${dailyLogs[weekIndex][dayIndex]}';
      savedLogs[weekIndex][dayIndex] = true;
    });
  }

  Future<void> pickImage(int weekIndex) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        images[weekIndex] = File(image.path);
      });
    }
  }

  void sign(int weekIndex) {
    setState(() {
      signedByStudent[weekIndex] = true;
    });
  }

  void approve(int weekIndex, bool isIndustrial) {
    setState(() {
      if (isIndustrial && signedByStudent[weekIndex]) {
        industrialApproved[weekIndex] = true;
      } else if (!isIndustrial && industrialApproved[weekIndex]) {
        universityApproved[weekIndex] = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Approved by ${isIndustrial ? "Industrial" : "University"} Supervisor!')));
  }

  void signMonthlySummary() {
    setState(() {
      monthlySignDateTime = 'Signed on ${DateTime.now().toLocal()}';
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Monthly Summary Signed!')));
  }

  void approveMonthlySummary(bool isIndustrial) {
    setState(() {
      if (isIndustrial) {
        // Logic for industrial approval
      } else {
        // Logic for university approval
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Monthly Summary Approved by ${isIndustrial ? "Industrial" : "University"} Supervisor!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ...List.generate(weeks.length, (weekIndex) {
              bool isEndOfMonth = (weekIndex + 1) % 4 == 0;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    color: weekIndex % 2 == 0 ? Color(0xFFE6F3F9) : Color(0xFFF9E6E9),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weeks[weekIndex],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                weeklyDescriptions[weekIndex] = value;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Weekly Description',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15),
                          ...List.generate(daysOfWeek.length, (dayIndex) {
                            Color buttonColor = (dayIndex % 2 == 0) ? Color(0xFF174359) : Color(0xFF903c50);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () => saveLog(weekIndex, dayIndex),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    backgroundColor: buttonColor,
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                  ),
                                  child: Text(daysOfWeek[dayIndex], style: TextStyle(color: Colors.white, fontSize: 12)),
                                ),
                                SizedBox(height: 8),
                                TextField(
                                  onChanged: (value) => dailyLogs[weekIndex][dayIndex] = value,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    suffixIcon: Text(
                                      dailyLogs[weekIndex][dayIndex].isNotEmpty
                                          ? DateTime.now().toLocal().toString()
                                          : '',
                                      style: TextStyle(fontSize: 10, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () => saveLog(weekIndex, dayIndex),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                        backgroundColor: Colors.green,
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                      ),
                                      child: Text(savedLogs[weekIndex][dayIndex] ? 'Saved' : 'Save', style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () => pickImage(weekIndex),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              backgroundColor: Colors.orange,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                            ),
                            child: Text('Upload Picture', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ),
                          if (images[weekIndex] != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Image.file(
                                images[weekIndex]!,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () => sign(weekIndex),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                            ),
                            child: Text('Sign', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: signedByStudent[weekIndex]
                                    ? () => approve(weekIndex, true)
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  backgroundColor: Colors.blueAccent,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                ),
                                child: Text('Approve (Industrial)', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                              ElevatedButton(
                                onPressed: industrialApproved[weekIndex]
                                    ? () => approve(weekIndex, false)
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  backgroundColor: Colors.purpleAccent,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                ),
                                child: Text('Approve (University)', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isEndOfMonth)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Monthly Summary for Weeks ${weekIndex - 3} to $weekIndex', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 15),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                monthlySummary = value;
                              });
                            },
                            maxLines: 4,
                            decoration: InputDecoration(
                              labelText: 'Monthly Summary Description',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(monthlySignDateTime, style: TextStyle(color: Colors.grey, fontSize: 12)),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: signMonthlySummary,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                ),
                                child: Text('Sign Monthly Summary', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                              ElevatedButton(
                                onPressed: () => approveMonthlySummary(true),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  backgroundColor: Colors.blueAccent,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                ),
                                child: Text('Approve (Industrial)', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                              ElevatedButton(
                                onPressed: () => approveMonthlySummary(false),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  backgroundColor: Colors.purpleAccent,
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                ),
                                child: Text('Approve (University)', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
