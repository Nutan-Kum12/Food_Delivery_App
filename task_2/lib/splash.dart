import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_2/home.dart';
import 'package:task_2/login.dart';
import 'package:task_2/main.dart';
import 'package:task_2/pages/login_or_auth.dart';
import 'package:task_2/pages/registerpage.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:2),()
    {
     Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context)=> LoginOrAuth(
      ),
     ));
    });
  }
  @override
  Widget build(BuildContext context) {
     var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Expanded(
        child: Center(
          child: Container(
              child: Image.asset("assets/Images/splash.png",
              fit:BoxFit.cover ,
             ),
          ),
        ),
      ),
    );
  }
}