import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_2/login.dart';
import 'package:task_2/pages/reset.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Account',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: MyAccountScreen(),
//     );
//   }
// }

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileSection(),
            SizedBox(height: 30),

            _buildAccountOption(context, 'Personal Information', Icons.person, PersonalInfoScreen()),
            SizedBox(height: 20),
            _buildAccountOption(context, 'Change Password', Icons.lock, ChangePasswordScreen()),
            SizedBox(height: 20),
            _buildAccountOption(context, 'Help & Support', Icons.help, HelpScreen()),

            SizedBox(height: 40),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenSize.width * 0.8, 50),
                backgroundColor: Colors.redAccent, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: Icon(Icons.logout),
              label: Text('Log Out', style: TextStyle(fontSize: 18)),
              onPressed: () {
                _showLogOutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
      User? user = FirebaseAuth.instance.currentUser;
    return Column(
      children: [
        SizedBox(height: 20),
        const Text(
          'Team 3',
          style: TextStyle(
            fontSize: 30,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
            user?.email ?? 'No Email', // Display user email or default
            style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildAccountOption(BuildContext context, String title, IconData icon, Widget targetScreen) {
    final screenSize = MediaQuery.of(context).size;
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenSize.width * 0.8, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      icon: Icon(icon, size: 24),
      label: Text(title, style: TextStyle(fontSize: 18)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
      },
    );
  }

  void _showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange,
          title: Text('Log Out'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () async {
               await FirebaseAuth.instance.signOut(); 
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(onTap: () {})), // Navigate to sign-in page
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  TextEditingController nameController = TextEditingController(text: 'team1');
  TextEditingController emailController = TextEditingController(text: 'team1@akgec.ac.in');
  TextEditingController dobController = TextEditingController(text: '01/01/01'); // Initial DOB
  String gender = 'Male'; // Initial gender value

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit Personal Information',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),

            _buildTextField('Name', nameController, isEditing),
            SizedBox(height: 20),

            _buildTextField('Email', emailController, isEditing),
            SizedBox(height: 20),

            _buildDobField(),
            SizedBox(height: 20),

            _buildGenderField(),
            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (isEditing) {
                    setState(() {
                      isEditing = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Changes saved successfully!')),
                    );
                  } else {
                    setState(() {
                      isEditing = true;
                    });
                  }
                },
                child: Text(isEditing ? 'Save Changes' : 'Edit Information', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: isEditing ? Colors.green : Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool isEnabled) {
    return TextField(
      controller: controller,
      enabled: isEnabled,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDobField() {
    return TextField(
      controller: dobController,
      enabled: isEditing,
      decoration: InputDecoration(
        labelText: 'Date of Birth',
        border: OutlineInputBorder(),
        suffixIcon: isEditing
            ? IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            _selectDate();
          },
        )
            : null,
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        dobController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  Widget _buildGenderField() {
    return DropdownButtonFormField<String>(
      value: gender,
      items: ['Male', 'Female', 'Other'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: isEditing
          ? (String? newValue) {
        setState(() {
          gender = newValue!;
        });
      }
          : null,
      decoration: InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  void _changePassword() async {
    String currentPassword = _currentPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmNewPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('New passwords do not match')),
      );
      return;
    }

    try {
      // Re-authenticate user
      User? user = _auth.currentUser;
      AuthCredential credential = EmailAuthProvider.credential(
        email: user?.email ?? '',
        password: currentPassword,
      );
      await user?.reauthenticateWithCredential(credential);

      // Update password
      await user?.updatePassword(newPassword);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password updated successfully!')),
      );
      _clearFields();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update password: $e')),
      );
    }
  }

  void _clearFields() {
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmNewPasswordController.clear();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Change Password',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _confirmNewPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text('Update Password', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange,
              ),
            ),
               SizedBox(height: 30),
             TextButton(  style: TextButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color
              // Set the minimum size (width, height)
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Set padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Set border radius
               ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                );
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: const Color.fromARGB(255, 8, 8, 8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Help & Support',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'For any queries or issues, please contact us at:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome to the Help and Support Center! We’re here to assist you with any questions or issues you may have while using our app.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Implement a feature like calling or emailing support here
              },
              child: Text('Contact Support', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
     ),
  );
  }
}