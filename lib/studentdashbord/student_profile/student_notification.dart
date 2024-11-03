import 'package:flutter/material.dart';

class StudentNotification extends StatefulWidget {
  const StudentNotification({super.key});

  @override
  _StudentNotificationState createState() => _StudentNotificationState();
}

class _StudentNotificationState extends State<StudentNotification> {
  List<NotificationModel> notifications = [
    NotificationModel(
      icon: Icons.check_circle,
      title: 'Attendance Update',
      message: 'Your attendance for the last week has been recorded successfully.',
      dateTime: DateTime(2024, 10, 21, 8, 30),
    ),
    NotificationModel(
      icon: Icons.chat,
      title: 'New Chat Message',
      message: 'You have a new message from your peer regarding the group project.',
      dateTime: DateTime(2024, 10, 21, 9, 0),
    ),
    NotificationModel(
      icon: Icons.book,
      title: 'Logbook Submission Reminder',
      message: 'Don’t forget to submit your logbook by the end of the week.',
      dateTime: DateTime(2024, 10, 20, 15, 0),
    ),
    NotificationModel(
      icon: Icons.assignment,
      title: 'Assignment Feedback',
      message: 'Your supervisor has provided feedback on your latest assignment.',
      dateTime: DateTime(2024, 10, 21, 16, 0),
    ),
    NotificationModel(
      icon: Icons.warning,
      title: 'Attendance Alert',
      message: 'You have missed two classes this month. Please check with your supervisor.',
      dateTime: DateTime(2024, 10, 21, 7, 45),
    ),
    NotificationModel(
      icon: Icons.event_note,
      title: 'Logbook Update Required',
      message: 'Please update your logbook with the latest entries for this week.',
      dateTime: DateTime(2024, 10, 21, 11, 0),
    ),
    NotificationModel(
      icon: Icons.notifications_active,
      title: 'Chat Group Reminder',
      message: 'Remember to check the group chat for important updates from your team.',
      dateTime: DateTime(2024, 10, 20, 16, 30),
    ),
    NotificationModel(
      icon: Icons.access_time,
      title: 'Upcoming Attendance Review',
      message: 'An attendance review meeting is scheduled for next Monday at noon.',
      dateTime: DateTime(2024, 10, 19, 12, 15),
    ),
    NotificationModel(
      icon: Icons.help,
      title: 'Support Request Acknowledged',
      message: 'Your request for assistance with attendance tracking has been acknowledged.',
      dateTime: DateTime(2024, 10, 20, 13, 5),
    ),
    NotificationModel(
      icon: Icons.assignment_turned_in,
      title: 'Logbook Approved',
      message: 'Your logbook submission has been approved by your supervisor.',
      dateTime: DateTime(2024, 10, 21, 10, 30),
    ),
    NotificationModel(
      icon: Icons.notifications,
      title: 'System Update Notice',
      message: 'The university system will undergo maintenance tonight. Expect downtime.',
      dateTime: DateTime(2024, 10, 20, 17, 0),
    ),
    NotificationModel(
      icon: Icons.business_center,
      title: 'Internship Attendance Requirement',
      message: 'Ensure you meet the attendance requirements for your internship program.',
      dateTime: DateTime(2024, 10, 19, 14, 0),
    ),
    NotificationModel(
      icon: Icons.event_available,
      title: 'Career Fair Attendance',
      message: 'Don’t forget to attend the career fair next month. Bring your logbook!',
      dateTime: DateTime(2024, 10, 18, 9, 0),
    ),
    // Additional notifications
    NotificationModel(
        icon: Icons.schedule,
        title: 'Project Deadline Reminder',
        message:
            'The deadline for submitting your group project is approaching. Make sure to finalize your contributions.',
        dateTime: DateTime(2024, 10, 22)),
    NotificationModel(
        icon: Icons.star,
        title: 'Scholarship Application Open',
        message:
            'Applications for the annual scholarship are now open. Check your email for details.',
        dateTime: DateTime(2024, 10, 19)),
    NotificationModel(
        icon: Icons.event,
        title: 'Guest Lecture Announcement',
        message:
            'Join us for a guest lecture on industry trends this Thursday at noon in the main hall.',
        dateTime: DateTime(2024, 10, 24)),
    NotificationModel(
        icon: Icons.feedback,
        title: 'Course Feedback Request',
        message:
            'We value your feedback! Please fill out the course evaluation form sent to your email.',
        dateTime: DateTime(2024, 10, 25)),
    NotificationModel(
        icon: Icons.lock_open,
        title: 'Password Change Required',
        message:
            'For security reasons, please change your password before the end of this week.',
        dateTime: DateTime(2024, 10, 26)),
    
];

String searchQuery = '';

@override
Widget build(BuildContext context) {
   // Filter notifications based on search query
   List<NotificationModel> filteredNotifications = notifications.where((notification) {
     return notification.title.toLowerCase().contains(searchQuery.toLowerCase());
   }).toList();

   return Scaffold(
     
     body:
     Column(children:[
       // Search Bar
       Padding(padding:
       const EdgeInsets.symmetric(horizontal:
      16.0).copyWith(top:
      16.0),child:
       TextField(onChanged:(value){
         setState(() {
           searchQuery =
           value;
         });
       },decoration:
       InputDecoration(hintText:'Search...',
         prefixIcon:
         Icon(Icons.search),filled:true,
         fillColor:
         Colors.white,border:
         OutlineInputBorder(borderRadius:
         BorderRadius.circular(8)),contentPadding:
         EdgeInsets.symmetric(vertical:
        12.0),),),),SizedBox(height:
        10), // Space between search bar and list
       
       // Notifications List
       Expanded(child:
       ListView.builder(itemCount:
       filteredNotifications.length,itemBuilder:(context,index){
         return NotificationCard(notification:
         filteredNotifications[index],);
       },),)
     ],)
   );
 }
}

class NotificationModel {
 IconData icon;
 String title;
 String message;
 DateTime dateTime;

 NotificationModel({required this.icon,
 required this.title,
 required this.message,
 required this.dateTime});
}

class NotificationCard extends StatelessWidget {
 final NotificationModel notification;

 const NotificationCard({super.key, required this.notification});

 @override
 Widget build(BuildContext context) {
   return Card(
     margin:
     EdgeInsets.symmetric(vertical:
    8,horizontal:
    16),
     elevation:
    4,
     shape:
     RoundedRectangleBorder(borderRadius:
     BorderRadius.circular(10)),
     color:
     Colors.white,
     child:
     Padding(padding:
     const EdgeInsets.all(16.0),child:
     Row(children:[
       Container(decoration:
       BoxDecoration(color:
       Colors.deepPurple[50],
         borderRadius:
         BorderRadius.circular(50),),child:
       Padding(padding:
       const EdgeInsets.all(8.0),child:
       Icon(notification.icon,color:
       Colors.deepPurple,size:
      30,),),),SizedBox(width:
      16),Expanded(child:
       Column(crossAxisAlignment:
       CrossAxisAlignment.start,
         children:[
           Text(notification.title,
             style:
             TextStyle(fontSize:
            18,fontWeight:
             FontWeight.bold,color:
             Colors.deepPurple)),
           Text(notification.message,
             style:
             TextStyle(fontSize:
            16,color:
             Colors.grey[600])),
           SizedBox(height:
          4),
           Text('${notification.dateTime.hour}:${notification.dateTime.minute.toString().padLeft(2,'0')} ${notification.dateTime.hour <12 ?'AM':'PM'}',
             style:
             TextStyle(fontSize:
            14,color:
             Colors.grey)),
         ],
       ))
     ]
     )
   ));
 }
}