import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentProgressScreen(),
    );
  }
}

class StudentProgressScreen extends StatefulWidget {
  const StudentProgressScreen({super.key});

  @override
  State<StudentProgressScreen> createState() => _StudentProgressScreenState();
}

class _StudentProgressScreenState extends State<StudentProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ProfileSection(),
                    const Divider(),
                    StudentList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 224, 219, 219),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('images/Ubsimage.png'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Adeneji Adebayo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            Text('STF-906-890', style: TextStyle(color: Color.fromARGB(255, 36, 30, 30))),
          ],
        ),
      ],
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final List<Map<String, String>> students = [
    {
      'name': 'Prisicila Abel',
      'id': 'SFE/22U/3021',
      'email': 'priscabeljuani@gmail.com',
      'image': 'images/priscillaprofile.png',
    },
    {
      'name': 'Melody Albinus',
      'id': 'SFE/23U/4033',
      'email': 'melodyalbinus@gmail.com',
      'image': 'images/melodyprofile.png',
    },
    {
      'name': 'Pererate Timothy',
      'id': 'SFE/22U/3032',
      'email': 'priscabeljuani@gmail.com',
      'image': 'images/pererateprofile.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: students.map((student) {
        return StudentCard(
          name: student['name']!,
          id: student['id']!,
          email: student['email']!,
          image: student['image']!,
        );
      }).toList(),
    );
  }
}

class StudentCard extends StatelessWidget {
  final String name;
  final String id;
  final String email;
  final String image;

  const StudentCard({
    super.key,
    required this.name,
    required this.id,
    required this.email,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(id, style: const TextStyle(color: Colors.black)),
                  const SizedBox(height: 8),
                  Text('Email address: $email', style: const TextStyle(color: Colors.black)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          color: const Color(0xFF174359),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                              backgroundColor: Colors.transparent,
                            ),
                            child: Text(
                              "Attendance 0%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width < 350 ? 10.0 : 12.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          color: const Color(0xFF903C50),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
                              backgroundColor: Colors.transparent,
                            ),
                            child: Text(
                              "Logbook View",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width < 350 ? 10.0 : 12.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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