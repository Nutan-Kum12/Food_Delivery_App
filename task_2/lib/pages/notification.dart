import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface, 
      appBar: AppBar(
        // backgroundColor:Theme.of(context).colorScheme.inversePrimary, 
        title: Text('Notification',
        style: TextStyle(
          fontSize:20,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('New',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color:  Theme.of(context).colorScheme.surface,
                  elevation: 5,
                  child:Container(
                    margin: EdgeInsets.all(8.0),
                    width: double.infinity,
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.cross,color: Colors.red.shade800),
                            SizedBox(width:8),
                            Text('Order Cancelled',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        Text('You have cancelled an order at Burger Hut.'
                        'We apologize for your inconvenience . we will try to'
                        'improve our service next time.',
                        style: TextStyle(
                          fontSize: 18
                        ),)
                      ],
                    ),
                  ) ,
                        
                ),
              ),
               Text('Old',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color:  Theme.of(context).colorScheme.surface,
                  elevation: 5,
                  child:Container(
                    margin: EdgeInsets.all(8.0),
                    width: double.infinity,
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.bagShopping,color: const Color.fromARGB(255, 20, 164, 12)),
                            SizedBox(width:8),
                            Text('Order Success',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        Text('You have cancelled an order at Burger Hut.'
                        'We apologize for your inconvenience . we will try to'
                        'improve our service next time.',
                        style: TextStyle(
                          fontSize: 18
                        ),)
                      ],
                    ),
                  ) ,
                        
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}