import 'package:flutter/material.dart';
import 'package:task_2/pages/menupage.dart';
import 'package:task_2/pages/promo.dart';
import 'package:task_2/pages/recommended.dart';
import 'package:task_2/pages/reviews.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
       backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: null, 
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.25,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/Images/grandma.jpg', 
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 70, 
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: screenHeight * 0.20, 
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/Images/gmlogo.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), 
              Padding(
                padding: const EdgeInsets.only(left:16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grandma\'s shop',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height:10),
                    Text(
                      'NYC, Broadway ave 79',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height:5),
                    Text(
                      'Opening',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.green, 
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                         Icon(Icons.star, color: Colors.orange, size: 14),
                           SizedBox(width:5),
                           Text('4.8  (1.2k)',
                           style: TextStyle(
                            fontSize:14 
                           ),
                           ),
                           Icon(Icons.shopping_bag_outlined),
                           Text('99+ orders',
                           style: TextStyle(
                            fontSize:14 
                           ),
                           ),
                      SizedBox(width:screenWidth*0.45),
                      InkWell(onTap: ()
                      {
                        Navigator.push(context,
                         MaterialPageRoute(builder:(context)=>ReviewPage()));
                      },
                        child: Text('Reviews',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                           decoration: TextDecoration.underline,
                        ),),
                      )
                      ],
                    ),
                      SizedBox(height: 20,),
                      Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[ Text('For You',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        )
                        ]
                      ),
                     ), 
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 4),
                child: MenuCardList(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 8),
                child: RecommendedList(),
              )
            ],
          ),
          
      ),
    );
  }
}
