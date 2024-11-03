// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeControllers = List<TextEditingController>.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'images/headerall.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text(
                'Verify Your Account',
                style: TextStyle(fontSize: 24, color: Color(0xFF333333)),
              ),
              SizedBox(height: 50),
              Image.asset(
                'images/verification.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(height: 20),
              Text('Enter Verification Code', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _codeControllers
                    .map((controller) => _verificationCodeField(context, controller))
                    .toList(),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF2D8E9B),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.2, 35),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String verificationCode = _codeControllers.map((controller) => controller.text).join();
                      print('Verification code: $verificationCode');
                      
                      // Navigate to ChangePasswordScreen using named route
                      Navigator.pushNamed(context, '/changepassword');
                    }
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verificationCodeField(BuildContext context, TextEditingController controller) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF2D8E9B)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2D8E9B)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2D8E9B)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter verification code';
          }
          return null;
        },
      ),
    );
  }
}
