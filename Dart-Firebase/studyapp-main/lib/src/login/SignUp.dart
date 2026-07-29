import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/src/authentication/firbase_auth_services.dart';

import 'package:studyapp/src/login/Login1.dart';

import 'package:studyapp/src/widgets/home.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final secondnameController = TextEditingController();
  final confrimPassword = TextEditingController();
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width * 1; // 90% of the screen width
    double containerHeight = screenSize.height * 0.4;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(0)),
                      ),
                      width: containerWidth,
                      height: containerHeight,
                    ),
                  ),
                  Positioned(
                    top: containerHeight * .3,
                    left: containerWidth * 0.5 - 50,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: containerWidth,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextFormField(
              //     controller: usernameController,
              //     keyboardType: TextInputType.name,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(20)),
              //       ),
              //       label: Text('First Name'),
              //       prefixIcon: Icon(
              //         Icons.person,
              //         color: Colors.black,
              //       ),
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return "please choose a user name ";
              //       } else if (value.length < 4) {
              //         return "Too short username ";
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              // const SizedBox(height: 5),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextFormField(
              //     controller: secondnameController,
              //     keyboardType: TextInputType.name,
              //     decoration: const InputDecoration(
              //       label: Text('Second Name'),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(20)),
              //       ),
              //       prefixIcon: Icon(
              //         Icons.person,
              //         color: Colors.black,
              //       ),
              //     ),
              //     validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return "please choose a user name ";
              //       } else if (value.length < 4) {
              //         return "Too short username ";
              //       }
              //       return null;
              //     },
              //   ),
              // ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    label: Text('User Email'),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please choose a email address ";
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return "enter a valid email address";
                    }
                    return null;
                  },
                ),
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    label: Text('Password'),
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
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: confrimPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    label: Text('Confirm Password'),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter a password";
                    } else if (value.length < 8) {
                      return "password must contain 8 charaters ";
                    } else if (value != passwordController.text) {
                      return "password missmatch";
                    }
                    return null;
                  },
                ),
              ),
              // const SizedBox(height: 5),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      User? user = await _auth.signUpWithEmailAndPassword(
                          emailController.text,
                          passwordController
                              .text); // Use signUpWithEmailAndPassword
                      if (user != null) {
                        print("user created successfully");
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.only(left: 50),
              //   child: Row(
              //     children: [
              //       Checkbox(value: false, onChanged: (bool? value) {}),
              //       const Text(
              //         'By creating an account you have to agree \n with our terms & conditions.',
              //         style: TextStyle(
              //           color: Color(0xFF858597),
              //           fontSize: 12,
              //           fontFamily: 'Poppins',
              //           fontWeight: FontWeight.w400,
              //           height: 0,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Color(0xFF858597),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Log in',
                          style: const TextStyle(
                            color: Color(0xFF3D5CFF),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            height: 0,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to the sign-up screen when "Sign up" is tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Login1()), // change it login
                              );
                            },
                        ),
                      ],
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
