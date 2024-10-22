import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_2/components/MyButton.dart';
import 'package:task_2/components/textfield.dart';
import 'package:task_2/home.dart';
import 'package:task_2/main.dart';


class LoginPage extends StatefulWidget{
  final void Function()? onTap;

    const LoginPage({super.key,
   required this. onTap
   }
   );

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passController=TextEditingController();

  void login()
  {
    // fill out authentication
    Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
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
                  right: 80, // Optional positioning
                  child: Image.asset('assets/Images/splash.png'),
                 ),
               ],
               ),
              ),
    
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                   MyTextField(
                controller:emailController,
                hintText:"Email",
                obscureText:false,
        
               ),
               
              SizedBox(height: screenHeight * 0.01),
              MyTextField(
                controller:passController,
                hintText:"Password",
                obscureText:true,
        
               ),
                SizedBox(height: screenHeight * 0.02),
                MyButton(text: 'Sign In', onTap:()
                {
                login();
                }
                ),
                SizedBox(height: screenHeight * 0.02),
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                         Text("Don't have an account?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                        ),),
                          SizedBox(width: screenWidth*0.01),
                          GestureDetector(
                            onTap:widget.onTap,
                            child: Text('Sign Up',
                             style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold
                            )
                            ),
                          )
                    ],
                                 ),
                 )
                ],
              )
          ],
        ),
      ),
    );
  }
}