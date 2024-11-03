// ignore_for_file: prefer_const_constructors, unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:naubsiwesapp/ibs_dashboard/ibs_student.dart';


import 'login_page.dart'; // Import LoginPage
import 'studentlogin.dart';
import 'ibslogin.dart';
import 'ubslogin.dart';
import 'forgetpassword.dart';
import 'verification.dart';
import 'changepassword.dart';
import 'usb_dashboard/usb_attendance.dart';
import 'studentdashbord/student_profile/start_siwes_attendace.dart';
import 'studentdashbord/logbook/logbook.dart';
import 'studentdashbord/student_profile/student_logbook.dart';
import 'usb_dashboard/ubs_report.dart';
import 'studentdashbord/student_profile/student_pictures.dart';

import 'ibs_dashboard/ibs_chatroom.dart';
import 'ibs_dashboard/ibs_student_progress.dart';
import 'ibs_dashboard/ibs_homepage.dart';

import 'ibs_dashboard/ibs_profile.dart';
import 'usb_dashboard/usb_profile.dart';
import 'studentdashbord/student_profile/student_profile.dart'; // This imports your StudentProfilePage
import 'studentdashbord/student_profile/student_attendance.dart';
import 'usb_dashboard/list_of_student_attach.dart';
import 'usb_dashboard/ibs_list_attach.dart';
import 'usb_dashboard/ubs_Notification.dart';
import 'studentdashbord/student_profile/student_chat.dart';
import 'updates/update.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:   Homepage(), // Start with the StudentProfilePage
      routes: {
        '/loginpage': (context) => const LoginPage(),
        '/studentlogin': (context) => StudentLogin(),
        '/ibslogin': (context) => IBSLogin(),
        '/ubslogin': (context) => UBLogin(),
        '/ubsprofile': (context) => USBProfilePage(),
        '/studentprofile': (context) => StudentProfilePage(),
        '/forgetPassword': (context) => ForgotPasswordPage(),
        '/verification': (context) => VerificationScreen(),
        '/changepassword': (context) => ChangePasswordPage(),
        '/studentattendance': (context) => AttendancePage(),
        '/ubsAttendance': (context) => StudentProgressScreen(),
        '/listofstudenttach': (context) => StudentListPage(),
        '/listofibsattach': (context) => IbsListAttach(),
        '/startsiwesattendance':(context)=>StartSiwesAttendace(),
        '/studentlogbook':(context)=>LogbookHome(),
        '/ubsNotification':(context)=>UbsNotification(),
        '/ibsprofile':(context)=>IBSProfilePage(), 
        '/ibschatroom':(contex)=>IBSChatRoomScreen()

         
        
      },
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0; // Index of the currently displayed image
  final List<String> images = [
    "images/bgchange1.png",
    "images/bgchange2.png",
    "images/bgchange3.png",
    "images/bgchange4.png",
    "images/bgchange5.png",
    "images/bgchange6.png",
  ];

  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);

    // Timer to change the image every 5 seconds
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        if (currentIndex < images.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0; // Loop back to the first image
        }
      });

      // Use WidgetsBinding to ensure the animation happens after the frame is built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            currentIndex,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 14, color: Colors.black); // Increased font size for better readability

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding around the content
          child: Column(
            children: <Widget>[
              Image.asset("images/headerall.png"),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to SIWES Tracker',
                          style: textStyle,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Enhancing Learning and Skill Development through',
                          style: textStyle,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Streamlined Industrial Training.',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF205A7A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/loginpage');
                      },
                      child: SizedBox(
                        width: 60.0,
                        height: 32,
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // PageView for rotating images without blinking
              Container(
                height: 200, // Set a fixed height for the image container
                margin: const EdgeInsets.symmetric(vertical: 16.0), // Margin for spacing around the PageView
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), // Rounded corners for the images
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover, // Ensure the image covers the container
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF18455F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(150, 44),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerpage'); // Assuming you have a register page
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding:
                        const EdgeInsets.all(8.0), // Add padding for better spacing
                    child: Text(
                      "Are you tired of cumbersome SIWES management processes? Look no further! In Are you tired of cumbersome SIWES management processes? Look no further! In Are you tired of cumbersome SIWES management processes? Look no further! In...",
                      style: textStyle,
                      textAlign:
                          TextAlign.center, // Center align text for better visibility
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}