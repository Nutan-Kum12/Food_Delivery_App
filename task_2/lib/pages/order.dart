import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text("Orders History"),
      backgroundColor: Theme.of(context).colorScheme.secondary,),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          orderTile(
            imagepath: 'assets/Images/gm1.jpg',
            title: 'Hamburger',
            date: '05, Apr',
          ),
          orderTile(
            imagepath: 'assets/Images/gm2.jpg',
            title: 'Pizza',
            date: '04, Apr',
          ),
          orderTile(
            imagepath: 'assets/Images/hm2.png',
            title: 'Pasta',
            date: '06, Apr',
          ),
          orderTile(
            imagepath: 'assets/Images/pizza3.jpg',
            title: 'Sushi',
            date: '06, Apr',
          ),
        ],
      ),
    );
  }

  Widget orderTile({
    required String imagepath,
    required String title,
    required String date,
  }) {
    

    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8,top:10),
      child: Container(
        padding:  EdgeInsets.all(4.0),
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
          title: Text(title),
          subtitle: Row(
            children: [
              Icon(
                Icons.check_circle,
                size: 16,
                color: Colors.green,
              ),
              SizedBox(width: 5),
              Text(
                'Delivered',
                style: TextStyle(
                 
                ),
              ),
              SizedBox(width: 10),
              Text(
                date,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            
          },
        ),
      ),
    );
  }
}
