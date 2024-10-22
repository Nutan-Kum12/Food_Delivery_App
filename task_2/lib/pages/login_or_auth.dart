import 'package:flutter/material.dart';
import 'package:task_2/login.dart';
import 'package:task_2/pages/registerpage.dart';
class LoginOrAuth extends StatefulWidget {
  const LoginOrAuth({super.key});

  @override
  State<LoginOrAuth> createState() => _LoginOrAuthState();
}

class _LoginOrAuthState extends State<LoginOrAuth> {
  bool showLoginPage=true;
  void togglePages()
  {
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePages);
    }
    else{
      return RegisterPage(onTap:togglePages);
    }
    
  }
}