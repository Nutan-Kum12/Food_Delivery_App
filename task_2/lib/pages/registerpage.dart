import 'package:flutter/material.dart';
import 'package:task_2/components/MyButton.dart';
import 'package:task_2/components/textfield.dart';
 class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key,
  required this.onTap
  }
  );

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passController=TextEditingController();
  final TextEditingController confirmpassController=TextEditingController();
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
              // SizedBox(height: screenHeight * 0.1)
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
                controller:emailController,
                hintText:"Email",
                obscureText:false,
        
               ),
               
        
              MyTextField(
                controller:passController,
                hintText:"Password",
                obscureText:true,
        
               ),
              MyTextField(
                controller:confirmpassController,
                hintText:" Confirm Password",
                obscureText:true,
        
               ),
        
                SizedBox(height: screenHeight * 0.02),
                MyButton(text: 'Sign Up', onTap:()
                {
        
                }
                ),
               SizedBox(height: screenHeight * 0.02),
                 Padding(
                   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                   child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                         Text("Already have an account?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                        ),),
                          SizedBox(width: screenWidth*0.01),
                          GestureDetector(
                            onTap:widget.onTap,
                            child: Text('Login Now',
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
        ),
      ),
    );
    
  }
}