import 'package:flutter/material.dart';

class RestaurantCarda extends StatefulWidget {
  final String imagepath;
  final String name;
  final String price;
  final double rating;
  final int reviewCount;
  final int discount;

  RestaurantCarda({
    super.key,
    required this.imagepath,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.discount,
  });

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCarda> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    widget.imagepath,
                    width: double.infinity,
                    height: 210,
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,bottom: 8),
                  child: Text(
                    widget.price,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width:8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Icon(Icons.star, color: Colors.orange, size: 18),
                ),
                SizedBox(width:8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '${widget.rating} (${widget.reviewCount})',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width:8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    child: Icon(
                     Icons.favorite,size: 18,
                      color: isFav ? Colors.red : Color.fromARGB(255, 0, 0, 0),
                    ),
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

class RestaurantCardLista extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      'imagepath': 'assets/Images/pizza1.jpg',
      'name': 'Pizza',
      'price':'\u{20B9} 199',
      'rating': 4.8,
      'reviewCount': 1200,
      'discount': 4,
    },
    {
      'imagepath': 'assets/Images/pizza2.jpg',
      'name': 'Chicken Fry',
      'price':'\u{20B9} 199',
      'rating': 4.5,
      'reviewCount': 980,
      'discount': 15,
    },
    {
      'imagepath': 'assets/Images/pizza3.jpg',
      'name': 'Burger',
      'price':'\u{20B9} 199',
      'rating': 4.6,
      'reviewCount': 1500,
      'discount': 6,
    },
    {
      'imagepath': 'assets/Images/pizza4.jpg',
      'name': 'Subway',
      'price':'\u{20B9} 199',
      'rating': 4.7,
      'reviewCount': 800,
      'discount': 5,
    },
    {
      'imagepath': 'assets/Images/pizza2.jpg',
      'name': 'Subway',
      'price':'\u{20B9} 199',
      'rating': 4.7,
      'reviewCount': 800,
      'discount': 5,
    },
  ];

  RestaurantCardLista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:  Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Discount',style: TextStyle(
          fontSize: 24,fontWeight: FontWeight.w700
        ),),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          var restaurant = restaurants[index];
          return RestaurantCarda(
            imagepath: restaurant['imagepath'],
            name: restaurant['name'],
            price: restaurant['price'],
            rating: restaurant['rating'],
            reviewCount: restaurant['reviewCount'],
            discount: restaurant['discount'],
          );
        },
      ),
    );
  }
}
