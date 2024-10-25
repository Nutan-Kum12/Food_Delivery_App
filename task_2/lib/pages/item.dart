import 'package:flutter/material.dart';
import 'package:task_2/theme/theme.dart';

class ItemPage extends StatefulWidget {
  ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<bool> isFavorite = [false, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Item"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          orderTile(
            index: 0,
            imagepath: 'assets/Images/gm1.jpg',
            title: 'Hamburger',
            price: '\u{20B9} 299',
          ),
          orderTile(
            index: 1,
            imagepath: 'assets/Images/gm2.jpg',
            title: 'Pizza',
            price: '\u{20B9} 299',
          ),
          orderTile(
            index: 2,
            imagepath: 'assets/Images/hm2.png',
            title: 'Pasta',
            price: '\u{20B9} 299',
          ),
          orderTile(
            index: 3,
            imagepath: 'assets/Images/pizza3.jpg',
            title: 'Sushi',
            price: '\u{20B9} 299',
          ),
        ],
      ),
    );
  }

  Widget orderTile({
    required int index, 
    required String imagepath,
    required String title,
    required String price,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8, top: 10),
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagepath,
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Row(
            children: [
              Text(
                price,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
               Icons.favorite,
              color: isFavorite[index] ? Colors.red : const Color.fromARGB(255, 33, 31, 31),
            ),
            onPressed: () {
              setState(() {
                isFavorite[index] = !isFavorite[index]; 
              });
            },
          ),
        ),
      ),
    );
  }
}
