import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_2/components/MyButton.dart';
import 'package:task_2/components/textfield.dart';
import 'package:task_2/main.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController(); 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  bool _isPasswordVisible = false; 

  Future<void> registerUser() async {
    // Checking input conditions for a valid registration
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passController.text.isNotEmpty &&
        passController.text == confirmpassController.text) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        
        await userCredential.user?.updateProfile(displayName: nameController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registered Successfully"),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Navigate to home page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The password provided is too weak.")),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The account already exists for that email.")),
          );
        }
      } catch (e) {
        print(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields and ensure passwords match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.35,
              child: Image.asset(
                'assets/Images/loginpage.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            MyTextField(
              controller: nameController, // Assign controller for name
              hintText: "Name",
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              suffixIcon: null,
            ),
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              suffixIcon: null,
            ),
            MyTextField(
              controller: passController,
              hintText: "Password",
              obscureText: !_isPasswordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                  });
                },
              ),
            ),
            MyTextField(
              controller: confirmpassController,
              hintText: "Confirm Password",
              obscureText: !_isPasswordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != passController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              suffixIcon: null,
            ),
            SizedBox(height: screenHeight * 0.02),
            MyButton(
              text: 'Sign Up',
              onTap: registerUser, // Invoke registration function on tap
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login Now',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
