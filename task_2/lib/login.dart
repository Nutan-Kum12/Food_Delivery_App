import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_2/components/MyButton.dart';
import 'package:task_2/components/textfield.dart';
import 'package:task_2/main.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key to track form state

  bool _isPasswordVisible = false;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Logged in successfully!"),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'Login failed'; 

        if (e.code == 'user-not-found') {
          errorMessage = 'No user found with that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Incorrect password provided.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.40,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/Images/loginpage.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 80,
                      child: Image.asset('assets/Images/splash.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  // Email field
                  MyTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false,
                    suffixIcon: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      // Check for presence of @ only
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null; // Return null if no error
                    },
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  // Password field with toggleable visibility
                  MyTextField(
                    controller: passController,
                    hintText: "Enter your password",
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null; // Return null if no error
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  MyButton(
                    text: 'Sign In',
                    onTap: () {
                      login(); 
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
