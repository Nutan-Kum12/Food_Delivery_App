import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/cart.dart';
import 'package:task_2/components/mydrawer.dart';
import 'package:task_2/pages/notification.dart';
import 'package:task_2/pages/promo.dart';
import 'package:task_2/pages/recommended.dart';
import 'package:task_2/theme/theme.dart';
import 'package:task_2/pages/search.dart'; // Ensure this import matches your file

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.secondary,
          title: Text('NYC, Broadway St...>'),
          actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () 
          {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>NotificationPage()));
          }),
          IconButton(icon: Icon(Icons.cabin), onPressed: () 
          {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>CartPage()));
          }),
         
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                  activeColor: Colors.white,
                  inactiveThumbColor: const Color.fromARGB(255, 11, 0, 0),
                );
              },
            ),
          ]
        ),
        
         body: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:  Theme.of(context).colorScheme.secondary,
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,bottom: 16),
              child: Text('Special offer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              ),
            ),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/Images/home1.jpg'), 
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "WHAT TO EAT TODAY\nShop up to 50% off",
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 22),
                  ),
                ),
              ),
            ), 
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                height: 240,
                child: GridView.count(
                  mainAxisSpacing:0,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  children: List.generate(menuItems.length, (index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(menuItems[index].imagePath),
                        SizedBox(height:5), 
                        Text(menuItems[index].itemName),
                      ],
                    );
                  }),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[ Text('Discount Granted!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.arrow_forward_ios_rounded),
                )
                ]
              ),
            ),

             RestaurantCardList(),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage('assets/Images/Card.jpg'), 
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 16,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[ Text("What's delicious around here?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.arrow_forward_ios_rounded),
                )
                ]
              ),
            ),
             RestaurantCardList(),
             SizedBox(height: 10),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal, 
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:AssetImage('assets/Images/pizza5.jpg'),
                            fit: BoxFit.cover )
                        ),
                      ),
                        Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Áp dung 02 voucher mõi dón',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:AssetImage('assets/Images/pizza6.jpg'),
                            fit: BoxFit.cover )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Áp dung 02 voucher mõi dón',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:AssetImage('assets/Images/pizza7.jpg'),
                            fit: BoxFit.cover )
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('Áp dung 02 voucher mõi dón',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),),
                      )
                    ],
                  ),
                )
              ],
            ), 
          ),
            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 16,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[ Text("Highlights of March",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.arrow_forward_ios_rounded),
                )
                ]
              ),
            ),

             RestaurantCardList(),

              Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 16,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[ Text("Nearby Restaurant",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.arrow_forward_ios_rounded),
                )
                ]
              ),
            ),
            SingleChildScrollView(
            scrollDirection: Axis.horizontal, 
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Container(
                          height: 140,
                          width: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image:AssetImage('assets/Images/res1.jpg'),
                              fit: BoxFit.cover )
                          ),
                        ),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(left: 8.0),
                         child: Text('Elisandra Restaurant',
                                               style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                                               ),),
                       ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text('Elisandra Restaurant'),
                          
                        ],
                      )

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:AssetImage('assets/Images/res2.jpg'),
                            fit: BoxFit.cover )
                        ),
                      ),
                       Text('Elisandra Restaurant',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text('Elisandra Restaurant'),
                          
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        width: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:AssetImage('assets/Images/res1.jpg'),
                            fit: BoxFit.cover )
                        ),
                      ),
                      Text('Elisandra Restaurant',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text('Elisandra Restaurant'),
                          
                        ],
                      )
                    ],
                  ),
                )
              ],
            ), 
          ),
                Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 16,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[ Text("Recommended For You",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,bottom:6),
              child: RecommendedList(),
            )
          ]
        ),
      ),
      
    );
  }
}
   


class MenuItem {
final String imagePath;
final String itemName;

MenuItem({required this.imagePath, required this.itemName});
}

final List<MenuItem> menuItems = [
  MenuItem(imagePath: 'assets/Images/hotdog.png', itemName: 'Flash Deals'),
  MenuItem(imagePath: 'assets/Images/niceshop.png', itemName: 'Nice Shop'),
  MenuItem(imagePath: 'assets/Images/points.png', itemName: 'Points'),
  MenuItem(imagePath: 'assets/Images/Rice.png', itemName: 'Rice'),
  MenuItem(imagePath: 'assets/Images/noodles.png', itemName: 'Noodles'),
  MenuItem(imagePath: 'assets/Images/vegetables.png', itemName: 'Vegetable'),
  MenuItem(imagePath: 'assets/Images/BBQ.png', itemName: 'BBQ'),
  MenuItem(imagePath: 'assets/Images/other.png', itemName: 'Other'),
];
             