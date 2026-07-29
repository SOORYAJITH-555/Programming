import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/src/authentication/firbase_auth_services.dart';

import 'package:studyapp/src/widgets/home.dart';

class Login1 extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Login1({Key? key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // Set the container width and height based on screen size
    double containerWidth = screenSize.width * 1; // 90% of the screen width
    double containerHeight = screenSize.height * 0.5;
    final FirebaseAuthService _auth = FirebaseAuthService();
    final _formkey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                        width: containerWidth, // Set the width
                        height: containerHeight,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: containerWidth, // Set the width of the rectangle
                        height: 100, // Set the height of the rectangle
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    70)) // Set the border width (optional)
                            ),
                        // Set border radius (optional)
                      ),
                    ),
                    const Positioned(
                        left: 150,
                        bottom: 0,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF1F1F39),
                                fontSize: 32,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 44.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          label: Text('user Email'),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please choose a email address ";
                        } else if (!value.contains('@') ||
                            !value.contains('.')) {
                          return "enter a valid email address";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      label: Text('password'),
                      prefixIcon: Icon(
                        Icons.security,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a password";
                      } else if (value.length < 8) {
                        return "password must contain 8 charaters ";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        User? user = await _auth.signInWithEmailAndPassword(
                            emailController.text,
                            passwordController
                                .text); // Use signUpWithEmailAndPassword
                        if (user != null) {
                          print("user created successfully");
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            color: Color(0xFF858597),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                            color: Color(0xFF3D5CFF),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to the sign-up screen when "Sign up" is tapped
                              Navigator.pushNamed(context, '/signup');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Admin login? ',
                          style: TextStyle(
                            color: Color(0xFF858597),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'login',
                          style: const TextStyle(
                            color: Color(0xFF3D5CFF),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to the sign-up screen when "Sign up" is tapped
                              Navigator.pushNamed(context, '/admin_login');
                            },
                        ),
                      ],
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
