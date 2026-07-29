import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:studyapp/src/authentication/addData.dart';
import 'package:studyapp/src/userprofile/drawer.dart';
import 'package:studyapp/src/userprofile/textBox.dart';
import 'package:studyapp/src/userprofile/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? image;
  final User currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("users");
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  Future<void> SaveProfile() async {
    if (image != null) {
      String resp =
          await StoreData().saveData(file: image!, currentUser: currentUser);
      if (resp == 'success') {
        // Show success message or perform any other actions upon successful profile save
      } else {
        // Show error message or perform error handling if profile save fails
      }
    } else {
      // Show a message or perform an action indicating that an image must be selected
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Future<void> editField(String field) async {
      String newValue = "";
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('edit $field'),
                content: TextField(
                  autofocus: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(hintText: "enter new $field"),
                  onChanged: (value) {
                    newValue = value;
                  },
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'cancel',
                        style: TextStyle(color: Colors.red[200]),
                      )),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(newValue),
                      child: Text(
                        'save',
                        style: TextStyle(color: Colors.green[600]),
                      ))
                ],
              ));
      // ignore: prefer_is_empty
      if (newValue.trim().length > 0) {
        await usersCollection.doc(currentUser.uid).update({field: newValue});
      }
    }

    // Set the container width and height based on screen size
    double containerWidth = screenSize.width * 1; // 90% of the screen width
    double containerHeight = screenSize.height * 0.15;

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('No data available'));
          }

          // Access user profile data from the snapshot
          var userProfile = snapshot.data!.data() as Map<String, dynamic>;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
            ),
            drawer: MyDrawer(onProfileTap: () {
              Navigator.pushNamed(context, '/profile');
            }, onsignOut: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/onboard', (route) => false);
            }, contactus: () {
              Navigator.pushNamed(context, '/settings');
            }),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Material(
                        elevation: 2,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: containerWidth,
                          height: containerHeight,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromRGBO(16, 206, 222, 100),
                                Colors.lightBlue
                              ],
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 50),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                image != null
                                    ? Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: const Offset(0, 3),
                                            )
                                          ],
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: MemoryImage(image!),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: const Offset(0, 3),
                                            )
                                          ],
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'https://www.shutterstock.com/image-vector/profile-icon-isolated-white-on-600nw-211470211.jpg'),
                                          ),
                                        ),
                                      ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey[300],
                                    child: IconButton(
                                      onPressed: selectImage,
                                      icon: const Icon(Icons.add_a_photo),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        userProfile['email']
                            as String, // Access user email from Firestore
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    text: userProfile['name'] ??
                        'text', // Example: Access 'text' field from Firestore
                    sectionname:
                        'U S E R N A ME', // Example: Access 'sectionname' field from Firestore
                    iconData: Icons.person,
                    onpressd: () => editField('name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    text: userProfile['college'] ??
                        'text', // Example: Access 'text' field from Firestore
                    sectionname:
                        'C O L L E G E', // Example: Access 'sectionname' field from Firestore
                    iconData: Icons.school,
                    onpressd: () => editField('college'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    text: userProfile['contact'] ??
                        'text', // Example: Access 'text' field from Firestore
                    sectionname:
                        'C O N T A C T', // Example: Access 'sectionname' field from Firestore
                    iconData: Icons.phone,
                    onpressd: () => editField('contact'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBox(
                    text: userProfile['bio'] ??
                        'text', // Example: Access 'text' field from Firestore
                    sectionname:
                        'B I O', // Example: Access 'sectionname' field from Firestore
                    iconData: Icons.info,
                    onpressd: () => editField('contact'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
