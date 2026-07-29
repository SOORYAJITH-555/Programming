import 'package:flutter/material.dart';
import 'package:studyapp/src/userprofile/listTitle.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onsignOut;
  final void Function()? contactus;

  const MyDrawer(
      {super.key, this.onProfileTap, this.onsignOut, this.contactus});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[700],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              MYListTitle(
                icon: Icons.home,
                text: 'H O M E',
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              SizedBox(
                height: 10,
              ),
              MYListTitle(
                icon: Icons.person,
                text: 'P R O F I L E',
                onTap: onProfileTap,
              ),
              SizedBox(
                height: 10,
              ),
              MYListTitle(
                icon: Icons.settings,
                text: 'S E T T I N G S',
                onTap: contactus,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MYListTitle(
              icon: Icons.logout,
              text: 'L O G O U T',
              onTap: onsignOut,
            ),
          ),
        ],
      ),
    );
  }
}
