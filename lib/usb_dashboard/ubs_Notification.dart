import 'package:flutter/material.dart';

class UbsNotification extends StatefulWidget {
  const UbsNotification({super.key});

  @override
  _UbsNotificationState createState() => _UbsNotificationState();
}

class _UbsNotificationState extends State<UbsNotification> {
  List<NotificationModel> notifications = [
    NotificationModel(
      icon: Icons.assignment,
      title: 'Logbook Update Request',
      message: 'A student has updated their logbook and is awaiting your approval.',
      dateTime: DateTime.now(),
    ),
    NotificationModel(
      icon: Icons.access_time,
      title: 'Attendance Update',
      message: 'A student has submitted their attendance for review.',
      dateTime: DateTime.now().subtract(Duration(hours: 1)),
    ),
    NotificationModel(
      icon: Icons.chat,
      title: 'New Chat Message',
      message: 'You have received a new message from a student regarding their logbook.',
      dateTime: DateTime.now().subtract(Duration(minutes: 30)),
    ),
    NotificationModel(
      icon: Icons.warning,
      title: 'Attendance Alert',
      message: 'A student has missed their attendance check-in today.',
      dateTime: DateTime.now().subtract(Duration(days: 1)),
    ),
    NotificationModel(
      icon: Icons.check_circle,
      title: 'Logbook Approved',
      message: 'Your approval is required for a logbook submission.',
      dateTime: DateTime.now().subtract(Duration(days: 2)),
    ),
    NotificationModel(
      icon: Icons.event_note,
      title: 'Upcoming Attendance Review',
      message: 'An attendance review meeting is scheduled for next week.',
      dateTime: DateTime.now().add(Duration(days: 3)),
    ),
    NotificationModel(
      icon: Icons.assignment_turned_in,
      title: 'Assignment Submission',
      message: 'A student has submitted their assignment for grading.',
      dateTime: DateTime.now().subtract(Duration(hours: 2)),
    ),
    NotificationModel(
      icon: Icons.feedback,
      title: 'Feedback Request',
      message: 'A student is requesting feedback on their recent project submission.',
      dateTime: DateTime.now().subtract(Duration(minutes: 45)),
    ),
    NotificationModel(
      icon: Icons.notifications_active,
      title: 'Group Project Reminder',
      message: 'Don’t forget to check the group project updates from students.',
      dateTime: DateTime.now().subtract(Duration(days: 1)),
    ),
    NotificationModel(
      icon: Icons.event_available,
      title: 'Career Fair Reminder',
      message: 'Reminder for the upcoming career fair next month. Encourage students to attend!',
      dateTime: DateTime.now().add(Duration(days: 10)),
    ),
    NotificationModel(
      icon: Icons.check_circle_outline,
      title: 'Logbook Review Completed',
      message: 'The logbook review process has been completed for a student.',
      dateTime: DateTime.now().subtract(Duration(days: 4)),
    ),
  ];

  List<NotificationModel> filteredNotifications = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredNotifications = notifications;
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      
      if (query.isEmpty) {
        filteredNotifications = notifications;
      } else {
        filteredNotifications = notifications.where((notification) {
          return notification.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UBS Notifications'),
        backgroundColor: Colors.black12,
        foregroundColor: const Color.fromARGB(255, 62, 22, 136),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate(notifications));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: updateSearchQuery,
              decoration:
                  InputDecoration(hintText: "Search by title...", border:
                  OutlineInputBorder()),
            ),
          ),
          Expanded(
            child:
                ListView.builder(
              itemCount:
                  filteredNotifications.length,
              itemBuilder:
                  (context, index) {
                return NotificationCard(
                  notification:
                      filteredNotifications[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationModel {
  IconData icon;
  String title;
  String message;
  DateTime dateTime;

  NotificationModel({required this.icon, required this.title, required this.message, required this.dateTime});
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
          EdgeInsets.symmetric(vertical:
          8, horizontal:
          16),
      elevation:
          4,
      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10),
      ),
      color:
          Colors.white,
      child:
          Padding(
        padding:
            const EdgeInsets.all(16.0),
        child:
            Row(
          children:
              [
            Container(
              decoration:
                  BoxDecoration(
                color:
                    Colors.deepPurple[50],
                borderRadius:
                    BorderRadius.circular(50),
              ),
              child:
                  Padding(
                padding:
                    const EdgeInsets.all(8.0),
                child:
                    Icon(
                  notification.icon,
                  color:
                      Colors.deepPurple,
                  size:
                      30,
                ),
              ),
            ),
            SizedBox(width:
            16),
            Expanded(
              child:
                  Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children:
                    [
                  Text(
                    notification.title,
                    style:
                        TextStyle(fontSize:
                        18, fontWeight:
                        FontWeight.bold, color:
                        Colors.deepPurple),
                  ),
                  Text(
                    notification.message,
                    style:
                        TextStyle(fontSize:
                        16, color:
                        Colors.grey[600]),
                  ),
                  SizedBox(height:
                  4),
                  Text(
                    '${notification.dateTime.hour}:${notification.dateTime.minute.toString().padLeft(2, '0')} ${notification.dateTime.hour <
                    12 ? 'AM' : 'PM'}',
                    style:
                        TextStyle(fontSize:
                        14, color:
                        Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
   }
}

class CustomSearchDelegate extends SearchDelegate {
  
   final List<NotificationModel> notifications;

   CustomSearchDelegate(this.notifications);

   @override
   List<Widget>? buildActions(BuildContext context) {
     return [
       IconButton(
         icon: Icon(Icons.clear),
         onPressed: () {
           query = '';
         },
       )
     ];
   }

   @override
   Widget? buildLeading(BuildContext context) {
     return IconButton(
       icon: Icon(Icons.arrow_back),
       onPressed: () {
         close(context, null);
       },
     );
   }

   @override
   Widget buildResults(BuildContext context) {
     final results = notifications.where((notification) =>
         notification.title.toLowerCase().contains(query.toLowerCase())).toList();

     return ListView.builder(
       itemCount: results.length,
       itemBuilder:(context, index) {
         return NotificationCard(notification : results[index]);
       },
     );
   }

   @override
   Widget buildSuggestions(BuildContext context) {
     final suggestions = notifications.where((notification) =>
         notification.title.toLowerCase().contains(query.toLowerCase())).toList();

     return ListView.builder(
       itemCount:suggestions.length,
       itemBuilder:(context,index){
         return ListTile(title : Text(suggestions[index].title));
       },
     );
   }
}