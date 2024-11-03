import 'package:flutter/material.dart';

class IBSLogin extends StatefulWidget {
  const IBSLogin({super.key});

  @override
  State<IBSLogin> createState() => _IBSLoginState();
}

class _IBSLoginState extends State<IBSLogin> {
  final _formKey = GlobalKey<FormState>();
  String _ibsId = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBS Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: SingleChildScrollView( // Make the body scrollable
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Industrial Based Supervisor Login',
                      style: TextStyle(
                        fontSize: 24, // Increased font size for better visibility
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Image.asset(
                      'images/ibsloging.png',
                      width: MediaQuery.of(context).size.width * 0.6, // Responsive width
                      height: MediaQuery.of(context).size.width * 0.6, // Responsive height
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'IBS-ID',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your IBS-ID';
                        }
                        return null;
                      },
                      onSaved: (value) => _ibsId = value!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const UnderlineInputBorder(),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgetPassword');
                        },
                        child: const Text(
                          'Forget Password',
                          style:
                              TextStyle(fontSize: 14, color: Colors.blue, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding:
                          const EdgeInsets.only(right :2.0), // Adjusted padding
                      child :TextButton(
                          style :TextButton.styleFrom(
                            backgroundColor :const Color(0xFF38437C),
                            shape :RoundedRectangleBorder(
                              borderRadius :BorderRadius.circular(5),
                            ),
                            minimumSize :Size(MediaQuery.of(context).size.width * 0.4, 20), // Responsive width
                          ),
                          onPressed :() {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.pushNamed(context, '/ibsprofile');
                            }
                          },
                          child :const Text('Login',
                                    style :TextStyle(fontSize :20, color :Colors.white, fontWeight :FontWeight.w100))),
                    ),
                    Align(
                      alignment :Alignment.bottomRight,
                      child :
                          Row(mainAxisAlignment :MainAxisAlignment.end, children:[
                            const Text("Don't have an account?",
                                style :TextStyle(fontSize :14, color :Colors.black)),
                            TextButton(
                              onPressed :() {
                                Navigator.pushNamed(context, '/signup'); // Update this to your route
                              },
                              child :const Text(' Sign Up',
                                  style :TextStyle(fontSize :16, color :Colors.red)),
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}