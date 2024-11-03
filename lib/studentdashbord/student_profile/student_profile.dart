import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:naubsiwesapp/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:naubsiwesapp/studentdashbord/student_profile/start_siwes_attendace.dart';
import 'package:naubsiwesapp/studentdashbord/student_profile/student_attendance.dart';
import 'package:naubsiwesapp/studentdashbord/student_profile/student_chat.dart';
import 'package:naubsiwesapp/studentdashbord/student_profile/student_logbook.dart';
import 'package:naubsiwesapp/studentdashbord/student_profile/student_notification.dart';
import 'package:naubsiwesapp/studentdashbord/student_profile/student_pictures.dart';
import 'package:naubsiwesapp/updates/update.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Create TextEditingControllers for each input field
  final _firstNameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _matrixNumberController = TextEditingController();
  final _staffIdController = TextEditingController();
  final _genderController = TextEditingController();
  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _lgaController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _alternativePhoneNumberController = TextEditingController();
  final _departmentController = TextEditingController();
  final _courseOfStudyController = TextEditingController();

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Variable to store the selected image file
  File? _imageFile;

  int _selectedIndex = 0; // Initial index set for Profile

  // List of pages to display
  final List<Widget> _pages = [
    const ProfileForm(),
    StartSiwesAttendace(),
    LogbookHome(), // Ensure these classes are properly defined in their respective files
    SIWESUploadScreen(),
    StudentChatRoom(),
    StudentNotification(),
    NewsFeedScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Save the form data
                print('Profile data saved!');
              }
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Logbook'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Pictures'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Update'),
        ],
        selectedItemColor: const Color.fromARGB(255, 23, 114, 189),
        unselectedItemColor: const Color.fromARGB(255, 77, 74, 74),
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPopupMenu(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(10.0, 10.0, 10.0, 10.0),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading:  Icon(FontAwesomeIcons.whatsapp),
            title: const Text('Send WhatsApp Message'),
            onTap: () async {
              final url = 'whatsapp://send?phone=+2341234567890&text=Hello%20from%20my%20app';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('WhatsApp is not installed.'),
                  ),
                );
              }
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Send Email'),
            onTap: () async {
              final Uri params = Uri(
                scheme: 'mailto',
                path: 'recipient@example.com',
                queryParameters: {
                  'subject': 'Subject',
                  'body': 'Message body',
                },
              );
              final url = params.toString();
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Email app is not available.'),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            // Profile picture
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 75.0,
                  backgroundColor: Colors.grey[200],
                  child: const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            // Button to update profile picture
            ElevatedButton(
              onPressed: () async {
                final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image != null) {
                  // Handle image selection
                }
              },
              child: const Text('Update Profile Picture'),
            ),

            // Input fields with spacing
            _buildTextFormField('First Name', true),
            _buildTextFormField('Surname', true),
            _buildTextFormField('Other Names', false),
            _buildTextFormField('Email Address', true, isEmail: true),
            _buildTextFormField('Matrix Number', true),
            _buildTextFormField('Staff ID', true),
            _buildTextFormField('Gender', false),
            _buildTextFormField('Country', true),
            _buildTextFormField('State', true),
            _buildTextFormField('LGA', true),
            _buildTextFormField('Phone Number', true, isPhone: true),
            _buildTextFormField('Alternative Phone Number', false),
            _buildTextFormField('Department', true),
            _buildTextFormField('Course of Study', true),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTextButton('Update', () {
                  // Handle update button click
                }),
                _buildTextButton('Save', () {
                  // Handle save button click
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(String label, bool isRequired, {bool isEmail = false, bool isPhone = false}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'Please enter your $label';
        }
        if (isEmail && (value != null && !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$").hasMatch(value))) {
          return 'Please enter a valid email address';
        }
        if (isPhone && (value != null && !RegExp(r"^\+?\d{10,13}$").hasMatch(value))) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    );
  }

  TextButton _buildTextButton(String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF38437C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(120, 45),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
