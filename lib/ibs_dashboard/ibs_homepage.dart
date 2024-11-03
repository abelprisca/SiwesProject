import 'package:flutter/material.dart';

class IndustrialBasedSupervisorHomepage extends StatelessWidget {
  const IndustrialBasedSupervisorHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 24, 39),
        title: const Text("Industrial-Based Supervisor Homepage"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Performing Students
              SectionTitle(title: "Top Performing Students"),
              const TopPerformingStudents(),
              const SizedBox(height: 16),

              // Quick Links
              SectionTitle(title: "Quick Links"),
              const QuickLinks(),
              const SizedBox(height: 16),

              // Notifications Panel
              SectionTitle(title: "Notifications"),
              const NotificationsPanel(),
              const SizedBox(height: 16),

              // Progress Indicators
              SectionTitle(title: "Progress Indicators"),
              const ProgressIndicators(),
              const SizedBox(height: 16),

              // Student Overview Statistics
              SectionTitle(title: "Student Overview Statistics"),
              const StudentOverviewStatistics(),
              const SizedBox(height: 16),

              // Customizable Message or Tip
              SectionTitle(title: "Message of the Day"),
              const MessageOfTheDay(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class TopPerformingStudents extends StatelessWidget {
  const TopPerformingStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          StudentTile(name: "John Doe", attendance: "95%"),
          StudentTile(name: "Jane Smith", attendance: "92%"),
          StudentTile(name: "Sam Wilson", attendance: "90%"),
        ],
      ),
    );
  }
}

class StudentTile extends StatelessWidget {
  final String name;
  final String attendance;

  const StudentTile({super.key, required this.name, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: Text(attendance),
    );
  }
}

class QuickLinks extends StatelessWidget {
  const QuickLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: [
        QuickLinkButton(title: "SIWES Guidelines"),
        QuickLinkButton(title: "Training Resources"),
        QuickLinkButton(title: "Student Portal"),
        QuickLinkButton(title: "Logbook Resources"),
      ],
    );
  }
}

class QuickLinkButton extends StatelessWidget {
  final String title;

  const QuickLinkButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
      ),
      child: Text(title),
    );
  }
}

class NotificationsPanel extends StatelessWidget {
  const NotificationsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: const [
          NotificationTile(message: "New message from student"),
          NotificationTile(message: "Approval needed for logbook entry"),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String message;

  const NotificationTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message),
    );
  }
}

class ProgressIndicators extends StatelessWidget {
  const ProgressIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ProgressTile(group: "Group A", progress: 75),
          ProgressTile(group: "Group B", progress: 60),
        ],
      ),
    );
  }
}

class ProgressTile extends StatelessWidget {
  final String group;
  final double progress;

  const ProgressTile({super.key, required this.group, required this.progress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(group),
      trailing: Text("${progress.toInt()}%"),
      subtitle: LinearProgressIndicator(value: progress / 100),
    );
  }
}

class StudentOverviewStatistics extends StatelessWidget {
  const StudentOverviewStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: const [
          StatTile(title: "Total Supervised Students", value: 30),
          StatTile(title: "Average Attendance Rate", value: 85),
          StatTile(title: "Submitted Logbook Count", value: 25),
        ],
      ),
    );
  }
}

class StatTile extends StatelessWidget {
  final String title;
  final int value;

  const StatTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Text("$value"),
    );
  }
}

class MessageOfTheDay extends StatelessWidget {
  const MessageOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text("Stay focused, stay positive!"),
    );
  }
}
