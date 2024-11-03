import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image section
              SizedBox(
                height: 200,
                child: Image.asset(
                  'images/siweslogo.png', // Replace with your image path
                  fit: BoxFit.cover, 
                ),
              ),
              SizedBox(height: 20.0),
              // Centered text
              Text(
                'Confirmation Successful!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Text(
                'Your account has been successfully created.',
                style: TextStyle(
                  fontSize: 18.0,
                 
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'You can now log in and access exclusive features.',
                style: TextStyle(
                  fontSize: 16.0,
                  
                ),
              ),
              SizedBox(height: 20.0),
              // Login button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login logic here
                    Navigator.pushNamed(context, '/loginpage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF38437C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(120, 45),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}