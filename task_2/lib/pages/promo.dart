import 'package:flutter/material.dart';
import 'package:task_2/menu.dart';

class RestaurantCard extends StatefulWidget {
  final String imagepath;
  final String name;
  final String distance;
  final double rating;
  final int reviewCount;
  final int discount;

  RestaurantCard({
    required this.imagepath,
    required this.name,
    required this.distance,
    required this.rating,
    required this.reviewCount,
    required this.discount,
  });

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool isFav = false; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MenuPage()));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    widget.imagepath,
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
                  bottom: 1,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '${widget.discount}% off your order',
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
              widget.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.distance,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(width: 5),
                Icon(Icons.star, color: Colors.orange, size: 14),
                Text(
                  '${widget.rating} (${widget.reviewCount})',
                  style: TextStyle(fontSize: 12),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  child: Icon(
                    isFav
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_outlined, 
                    color: isFav ? Colors.red : const Color.fromARGB(255, 0, 0, 0), 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantCardList extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      'imagepath': 'assets/Images/pizza1.jpg',
      'name': 'Pizza Hut',
      'distance': '1.5 km',
      'rating': 4.8,
      'reviewCount': 1200,
      'discount': 4,
    },
    {
      'imagepath': 'assets/Images/pizza2.jpg',
      'name': 'Domino\'s',
      'distance': '2.0 km',
      'rating': 4.5,
      'reviewCount': 980,
      'discount': 15,
    },
    {
      'imagepath': 'assets/Images/pizza3.jpg',
      'name': 'Burger King',
      'distance': '0.8 km',
      'rating': 4.6,
      'reviewCount': 1500,
      'discount': 6,
    },
    {
      'imagepath': 'assets/Images/pizza4.jpg',
      'name': 'Subway',
      'distance': '3.2 km',
      'rating': 4.7,
      'reviewCount': 800,
      'discount': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: 250, // Height of the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          var restaurant = restaurants[index];
          return RestaurantCard(
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
