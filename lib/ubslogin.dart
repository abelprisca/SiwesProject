import 'package:flutter/material.dart';

class UBLogin extends StatefulWidget {
  const UBLogin({super.key});

  @override
  State<UBLogin> createState() => _UBLoginState();
}

class _UBLoginState extends State<UBLogin> {
  final _formKey = GlobalKey<FormState>();
  String _ubsId = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 20),
                const Text(
                  'University-Based Supervisor Login',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Image.asset(
                  'images/usblogin.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'UBS-ID',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your UBS-ID';
                    }
                    return null;
                  },
                  onSaved: (value) => _ubsId = value!,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
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
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38437C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(60, 40),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print('UBS-ID: $_ubsId, Password: $_password');
                        Navigator.pushNamed(context, '/ubsprofile');
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
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
