import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/cart.dart';
import 'package:task_2/home.dart';
import 'package:task_2/menu.dart';
import 'package:task_2/pages/order.dart';
import 'package:task_2/splash.dart';
import 'package:task_2/theme/theme.dart';
// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
  ChangeNotifierProvider(create:(context)=>ThemeProvider(),
  child:const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 2',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SplashScreen(), 
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex=0;
  final List<Widget>pages=[
    HomePage(),
    MenuPage(),
    CartPage(),
    OrderPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary, 
        color:  Theme.of(context).colorScheme.secondary,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index){
          setState(() {
            pageIndex=index;
          });
        },
        items:[
        Icon(Icons.home),
        Icon(Icons.favorite),
        Icon(Icons.pages_outlined),
        Icon(Icons.reviews_outlined),
      ]),
      appBar: null,
      body: pages[pageIndex],
    );
  }
}
