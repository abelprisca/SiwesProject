import 'package:flutter/material.dart';


// Define routes
Map<String, WidgetBuilder> routes = {
  
};


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              TextSpan(
                text: '/Sign-up',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "images/siweslogo.png",
              width: 150,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildOption(
                    image: "images/studentlogin.png",
                    text: "Student",
                    onPressed: () {
                      Navigator.pushNamed(context, '/studentlogin');
                    },
                  ),
                  SizedBox(height: 20),
                  _buildOption(
                    image: "images/ibsloging.png",
                    text: "Industrial-Based Supervisor",
                    onPressed: () {
                      Navigator.pushNamed(context, '/ibslogin');
                    },
                  ),
                  SizedBox(height: 20),
                  _buildOption(
                    image: "images/usblogin.png",
                    text: "University-Based Supervisor",
                    onPressed: () {
                      Navigator.pushNamed(context, '/ubslogin');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildOption({
    required String image,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 100,
          height: 100,
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

// Create separate login pages for each option
class StudentLoginPage extends StatelessWidget {
  const StudentLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text('Student Login Page'),
      ),
    );
  }
}

class IndustrialBasedSupervisorLoginPage extends StatelessWidget {
  const IndustrialBasedSupervisorLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text('Industrial-Based Supervisor Login Page'),
      ),
    );
  }
}

class UniversityBasedSupervisorLoginPage extends StatelessWidget {
  const UniversityBasedSupervisorLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Text('University-Based Supervisor Login Page'),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'SIWES Login',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        ...routes,
      },
    ),
  );
}
