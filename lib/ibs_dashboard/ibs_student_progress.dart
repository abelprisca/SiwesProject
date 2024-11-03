import 'package:flutter/material.dart';

class IBStudentProgressScreen extends StatefulWidget {
  const IBStudentProgressScreen({super.key});

  @override
  State<IBStudentProgressScreen> createState() => _IBStudentProgressScreenState();
}

class _IBStudentProgressScreenState extends State<IBStudentProgressScreen> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 24, 39),
        title: const Text(
          "VIEW STUDENT PROGRESS",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
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
                    IBProfileSection(),
                    const Divider(),
                    IBStudentList(students: students),
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

class IBProfileSection extends StatelessWidget {
  const IBProfileSection({super.key});

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

class IBStudentList extends StatelessWidget {
  final List<Map<String, String>> students;

  const IBStudentList({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: students.map((student) {
        return IBStudentCard(
          name: student['name']!,
          id: student['id']!,
          email: student['email']!,
          image: student['image']!,
        );
      }).toList(),
    );
  }
}

class IBStudentCard extends StatelessWidget {
  final String name;
  final String id;
  final String email;
  final String image;

  const IBStudentCard({
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
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              backgroundColor: Colors.transparent,
                            ),
                            child: Text(
                              "Attendance 0%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width < 350 ? 9.0 : 11.0,
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
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              backgroundColor: Colors.transparent,
                            ),
                            child: Text(
                              "Logbook View",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width < 350 ? 9.0 : 11.0,
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
