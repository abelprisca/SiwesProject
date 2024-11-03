import 'dart:io'; // Import to handle file operations
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart'; // Import for image picking
import 'package:naubsiwesapp/ibs_dashboard/ibs_chatroom.dart';
import 'package:naubsiwesapp/ibs_dashboard/ibs_student_progress.dart';
import 'package:naubsiwesapp/ibs_dashboard/ibs_student.dart';
import 'package:naubsiwesapp/updates/update.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

class IBSProfilePage extends StatefulWidget {
  const IBSProfilePage({super.key});

  @override
  _IBSProfilePageState createState() => _IBSProfilePageState();
}

class _IBSProfilePageState extends State<IBSProfilePage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each input field
  final _firstNameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _emailController = TextEditingController();
  final _ibsIdController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _alternativePhoneNumberController = TextEditingController();
  final _genderController = TextEditingController();
  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _lgaController = TextEditingController();
  final _departmentController = TextEditingController();
  final _courseOfStudyController = TextEditingController();

  int _selectedIndex = 0; // Default page index for Home (Profile)
  String? _imagePath; // To store the selected image path

  // List of pages to display
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      Placeholder(), // Home page placeholder
      ProfileForm(
        imagePath: _imagePath,
        onImagePicked: (String path) {
          setState(() {
            _imagePath = path; // Update the image path when an image is picked
          });
        },
        firstNameController: _firstNameController,
        surnameController: _surnameController,
        otherNamesController: _otherNamesController,
        emailController: _emailController,
        ibsIdController: _ibsIdController,
        phoneNumberController: _phoneNumberController,
        alternativePhoneNumberController: _alternativePhoneNumberController,
        genderController: _genderController,
        countryController: _countryController,
        stateController: _stateController,
        lgaController: _lgaController,
        departmentController: _departmentController,
        courseOfStudyController: _courseOfStudyController,
        formKey: _formKey,
      ),
      IBSSupervisedStudentsScreen(),
      IBStudentProgressScreen(),
      IBSChatRoomScreen(),
      NewsFeedScreen(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBS Profile'),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Student'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: 'Progress'), // Changed to Progress
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Update'),
        ],
        selectedItemColor: Color(0xFF174359),
        unselectedItemColor: Colors.grey,
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
            leading: Icon(FontAwesomeIcons.whatsapp, color: Colors.green), // WhatsApp icon in green
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
            leading: Icon(FontAwesomeIcons.envelope, color: Colors.blue), // Email icon in blue
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

// Profile Form widget
class ProfileForm extends StatelessWidget {
  final String? imagePath; // Image path from the parent widget
  final ValueChanged<String> onImagePicked; // Callback for image picking
  final TextEditingController firstNameController;
  final TextEditingController surnameController;
  final TextEditingController otherNamesController;
  final TextEditingController emailController;
  final TextEditingController ibsIdController;
  final TextEditingController phoneNumberController;
  final TextEditingController alternativePhoneNumberController;
  final TextEditingController genderController;
  final TextEditingController countryController;
  final TextEditingController stateController;
  final TextEditingController lgaController;
  final TextEditingController departmentController;
  final TextEditingController courseOfStudyController;
  final GlobalKey<FormState> formKey;

  const ProfileForm({
    super.key,
    required this.imagePath,
    required this.onImagePicked,
    required this.firstNameController,
    required this.surnameController,
    required this.otherNamesController,
    required this.emailController,
    required this.ibsIdController,
    required this.phoneNumberController,
    required this.alternativePhoneNumberController,
    required this.genderController,
    required this.countryController,
    required this.stateController,
    required this.lgaController,
    required this.departmentController,
    required this.courseOfStudyController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    ImagePicker().pickImage(source: ImageSource.gallery).then((pickedFile) {
                      if (pickedFile != null) {
                        onImagePicked(pickedFile.path);
                      }
                    });
                  },
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: imagePath != null ? FileImage(File(imagePath!)) : null,
                    child: imagePath == null
                        ? const Icon(
                            Icons.account_circle,
                            size: 100,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextFormField(firstNameController, 'First Name', true),
            _buildTextFormField(surnameController, 'Surname', true),
            _buildTextFormField(otherNamesController, 'Other Names', false),
            _buildTextFormField(emailController, 'Email Address', true, isEmail: true),
            _buildTextFormField(ibsIdController, 'IBS-ID', true),
            _buildTextFormField(phoneNumberController, 'Phone Number', true),
            _buildTextFormField(alternativePhoneNumberController, 'Alternative Phone Number', false),
            _buildTextFormField(genderController, 'Gender', true),
            _buildTextFormField(countryController, 'Country', true),
            _buildTextFormField(stateController, 'State', true),
            _buildTextFormField(lgaController, 'LGA', true),
            _buildTextFormField(departmentController, 'Department', true),
            _buildTextFormField(courseOfStudyController, 'Course of Study', true),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Save functionality here
                                          
                      print("Profile saved.");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 64, 92, 116), // Blue background
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white), // White text
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Update functionality here
                      print("Profile updated.");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 64, 92, 116), // Blue background
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.white), // White text
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build text fields
  Widget _buildTextFormField(TextEditingController controller, String label, bool required,
      {bool isEmail = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
        ),
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return '$label is required';
          }
          if (isEmail && value != null && value.isNotEmpty && !value.contains('@')) {
            return 'Enter a valid email';
          }
          return null;
        },
      ),
    );
  }
}
