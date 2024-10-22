import 'package:flutter/material.dart';
import 'package:task_2/pages/order.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
  child: AnimatedContainer(
    duration: const Duration(seconds: 3),
    curve: Curves.fastEaseInToSlowEaseOut,
    color: Theme.of(context).colorScheme.surface,
    child: ListView(
      children: [
         Container(
          height: 200,
           child: DrawerHeader(
            decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius:45,
                  backgroundImage: AssetImage('assets/Images/splash.png'),
                ),
                SizedBox(height: 5),
                Text(
                  'John Doe',
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
                ),
                 SizedBox(height: 5),
                Text(
                  'ID: 2356AS876',
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
                ),
              ],
            ),
                   ),
         ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading:  Icon(Icons.language_outlined,),
              title:  Text(
                'Language',
                style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {

              },
              trailing:  Icon(Icons.arrow_forward_ios,)
            ),
            ListTile(
              leading:  Icon(Icons.laptop_chromebook_sharp,),
              title:  Text(
                'Order History',
                style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.push( context,
                 MaterialPageRoute(builder: (context) => OrderPage()),
                 );

              },
                trailing:  Icon(Icons.arrow_forward_ios,)
            ),
            ListTile(
              leading:  Icon(Icons.add_moderator_sharp,),
              title:  Text(
                'My Address',
                style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
               
              },
                trailing:  Icon(Icons.arrow_forward_ios,)
            ),
            ListTile(
              leading: const Icon(Icons.policy_outlined,),
              title: const Text(
                'Terms and policies',
                style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
           
              },
                trailing:  Icon(Icons.arrow_forward_ios,)
            ),
          ],
        ),
        SizedBox( height: 420),
      ],
    ),

  ),
 );
  }
}