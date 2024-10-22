import 'package:flutter/material.dart';
import 'package:task_2/menu.dart';

class MenuCard extends StatelessWidget {
  final String imagepath;
  final String name;
  final String distance;
  final double rating;
  final int reviewCount;
   final int discount;
  

  MenuCard({
    required this.imagepath,
    required this.name,
    required this.distance,
    required this.rating,
    required this.reviewCount,
    required this.discount,
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,right: 8,left: 8),
        child: Container( 
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      imagepath,
                      width: 200,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'PROMO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                
                  Positioned(
                    bottom:1,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                      '$discount % off your order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 10),
              
              Text(
                name,
                style: TextStyle(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 4),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    distance,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.star, color: Colors.orange, size: 14),
                  SizedBox(width:6),
                  Text(
                    '$rating  ($reviewCount)',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.favorite_outline_outlined)
                ],
              ), 
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCardList extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      'imagepath': 'assets/Images/gm2.jpg',
      'name': 'Pizza',
      'distance': '\u20B9 399',
      'rating': 4.8,
      'reviewCount': 1200,
      'discount':4
    },
    {
      'imagepath': 'assets/Images/gm1.jpg',
      'name': 'Chicken Fry',
      'distance': '\u20B9 299',
      'rating': 4.5,
      'reviewCount': 980,
      'discount':15
    },
    {
     'imagepath': 'assets/Images/pizza3.jpg',
      'name': 'Burger',
      'distance': '\u20B9 199',
      'rating': 4.6,
      'reviewCount': 1500,
      'discount':6
    },
    {
     'imagepath': 'assets/Images/pizza4.jpg',
      'name': 'Roll',
      'distance': '\u20B9 249',
      'rating': 4.7,
      'reviewCount': 800,
      'discount':5
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Theme.of(context).colorScheme.surface,
      height: 250, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          var restaurant = restaurants[index];
          return MenuCard(
            imagepath: restaurant['imagepath'],
            name: restaurant['name'],
            distance: restaurant['distance'],
            rating: restaurant['rating'],
            reviewCount: restaurant['reviewCount'],
            discount: restaurant['discount'],
          );
        },
      ),
    );
  }
}


