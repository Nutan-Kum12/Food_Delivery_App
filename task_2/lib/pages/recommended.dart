import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  final String imagepath;
  final String name;
  final String distance;
  final double rating;
  final int reviewCount;

  Recommended({
    required this.imagepath,
    required this.name,
    required this.distance,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Theme.of(context).colorScheme.surface,
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    imagepath,
                    width: double.infinity,
                    height: 200,
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
                      '4% off your order',
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  distance,
                  style: TextStyle(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.star, color: Colors.orange, size: 14),
                Text(
                  '$rating  ($reviewCount)',
                  style: TextStyle(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.favorite_outline_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, 
      physics: NeverScrollableScrollPhysics(), 
      children: [
        Recommended(
          imagepath: 'assets/Images/hamburger.jpg',
          name: 'Hamburger',
          distance: '2.0 km',
          rating: 4.5,
          reviewCount: 980,
        ),
        Recommended(
          imagepath: 'assets/Images/hm2.png',
          name: 'Domino\'s',
          distance: '2.0 km',
          rating: 4.5,
          reviewCount: 980,
        ),
        Recommended(
          imagepath: 'assets/Images/hamburger2.jpg',
          name: 'McDonald\'s',
          distance: '3.5 km',
          rating: 4.2,
          reviewCount: 760,
        ),
      ],
    );
  }
}


