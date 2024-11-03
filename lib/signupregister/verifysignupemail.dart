import 'package:flutter/material.dart';

class VerificationEmailSentPage extends StatelessWidget {
  const VerificationEmailSentPage({super.key});

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
                'Verification email sent!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              // Gmail icon and text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    size: 30.0,
                    color: Colors.red, // Customize the color
                  ),
                  SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () {
                      // Handle checking email logic here
                    },
                    child: Text(
                      'Check your Email Here',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
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