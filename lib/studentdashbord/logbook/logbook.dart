


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Logbook extends StatefulWidget {
  const Logbook({super.key});

  @override
  _LogbookState createState() => _LogbookState();
}

class _LogbookState extends State<Logbook> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 183));
  List<DateTime> _logDates = [];
  Map<DateTime, dynamic> _logEntries = {};
  List<String> _weeks = [];

  @override
  void initState() {
    super.initState();
    _generateLogDates();
    _generateWeeks();
  }

  void _generateLogDates() {
    for (int i = 0; i < 183; i++) {
      DateTime date = _startDate.add(Duration(days: i));
      if (date.weekday >= 1 && date.weekday <= 6) {
        _logDates.add(date);
        _logEntries[date] = {
          'title': '',
          'description': '',
          'saved': false,
          'updated': false,
          'dateSaved': '',
        };
      }
    }
  }

  void _generateWeeks() {
    for (int i = 0; i < 26; i++) {
      DateTime startDate = _startDate.add(Duration(days: i * 7));
      DateTime endDate = startDate.add(const Duration(days: 6));
      _weeks.add('${DateFormat("yyyy-MM-dd").format(startDate)} - ${DateFormat("yyyy-MM-dd").format(endDate)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logbook'),
        backgroundColor: const Color(0xFF38437C),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF174359),
              const Color(0xFF903c50),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _weeks.length,
          itemBuilder: (context, index) {
            return Card(
              color: _logEntries[_logDates[index * 7]]['saved']
                  ? const Color.fromARGB(255, 14, 148, 83)
                  : _logEntries[_logDates[index * 7]]['updated']
                      ? Colors.blueAccent
                      : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _weeks[index],
                      style: const TextStyle(fontSize: 18),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _logEntries[_logDates[index * 7]]['title'] = value;
                          _logEntries[_logDates[index * 7]]['updated'] = true;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _logEntries[_logDates[index * 7]]['description'] = value;
                          _logEntries[_logDates[index * 7]]['updated'] = true;
                        });
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF38437C),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _logEntries[_logDates[index * 7]]['saved'] = true;
                          _logEntries[_logDates[index * 7]]['updated'] = false;
                          _logEntries[_logDates[index * 7]]['dateSaved'] =
                              DateTime.now().toString();
                        });
                      },
                      child: const Text('Save Log Entry'),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        _logEntries[_logDates[index * 7]]['dateSaved'],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF38437C),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Upload image
                      },
                      child: const Text('Upload Image'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
     

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Monthly summary logic here
          },
          tooltip: 'Monthly Summary',
          backgroundColor: const Color(0xFF38437C),
          child: const Icon(Icons.insert_chart),
        ));
  }
}
