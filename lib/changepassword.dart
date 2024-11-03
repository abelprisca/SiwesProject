// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';


class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      
            
     
      body: Center(
        
        child: Padding(
          
          padding: const EdgeInsets.all(
              30.0), // Increased padding for better centering
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset('images/headerall.png'
                ),
              ), 
              Image.asset(
                'images/changepassword.png', 
                height: 120,
                width: 120, 
              ),
              const SizedBox(height: 40), 
              Form(
                // Consider adding a GlobalKey to manage form validation
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter New Password',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width:
                                  2.0), // Increased border width for a more distinct line
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        // Add your password validation logic here
                        if (value!.isEmpty) {
                          return 'Please enter a new password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Confirm New Password',
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width:
                                  2.0), // Increased border width for a more distinct line
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        // Add your password confirmation logic here
                        if (value!.isEmpty) {
                          return 'Please confirm the new password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40), // Increased spacing
                    ElevatedButton(
                      onPressed: () {
                        // Implement your password change logic here
                      },
                      child: const Text('Change Password'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
