import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:task_2/login.dart';
import 'package:task_2/pages/account.dart';
import 'package:task_2/pages/order.dart';
import 'package:task_2/pages/orderhistory.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        curve: Curves.fastEaseInToSlowEaseOut,
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage('assets/Images/splash.png'),
                    ),
                    SizedBox(height: 5),
                    Text(
                      user?.displayName ?? 'User Name', // Display user name or default
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5),
                    Text(
                      user?.email ?? 'No Email', // Display user email or default
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: Icon(Icons.language_outlined),
                  title: Text(
                    'Language',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () {},
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.laptop_chromebook_sharp),
                  title: Text(
                    'Order History',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
                    );
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.add_moderator_sharp),
                  title: Text(
                    'My Account',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context) => MyAccountScreen()),
                         );

                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.policy_outlined),
                  title: Text(
                    'Terms and Policies',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () {},
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            // Spacer(), // Pushes the sign-out button to the bottom
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'Sign Out',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut(); 
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(onTap: () {})), // Navigate to sign-in page
                );
              },
            ),
            SizedBox(height: 20), // Adds space at the bottom
          ],
        ),
      ),
    );
  }
}
