import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Signup/Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: const Color.fromARGB(255, 3, 10, 15), // Change the color to your desired value
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Image.asset(
                    'images/siweslogo.png',
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
                SizedBox(height: 20.0),
                
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your surname';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Surname',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?$").hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 190, 190, 190).withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButtonFormField<String>(
                      value: 'Select', // Set the default value to 'Student'
                      items: ['Student', 'IBS', 'UBS', 'Select']
                          .map((String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (String? value) {},
                      decoration: InputDecoration(
                        border: InputBorder.none, // Remove default border
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with signup logic
                        print('Form is valid!');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38437C),
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      minimumSize: const Size(double.infinity, 45),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}