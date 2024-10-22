import 'package:flutter/material.dart';

class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.secondary ,
         title: Text('Cart',
        style: TextStyle(
          fontSize:20,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Images/smiling.png'),
              SizedBox(height: 8,),
              Text('No Orders',
          style: TextStyle(
            fontSize:24,
            fontWeight: FontWeight.w800,
            color: Colors.red
          ),
          ),
          SizedBox(height: 8,),
          Text('Sorry,You have no orders in your cart,\n'
          'Please add your order to your cart.',
          style:TextStyle(
            fontSize: 21
          ) ,)
        
            ],
          ),
        ),
      ) ,
     
    );
  }
}