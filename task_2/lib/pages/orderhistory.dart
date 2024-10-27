import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(orderId: '4', date: 'Oct 20, 2024', total: 3999.00, status: 'Delivered', imageUrl: 'assets/Images/pizza1.jpg'),
    Order(orderId: '3', date: 'Oct 18, 2024', total: 5999.00, status: 'Shipped', imageUrl: 'assets/Images/pizza2.jpg'),
    Order(orderId: '2', date: 'Oct 15, 2024', total: 2999.00, status: 'Cancelled', imageUrl: 'assets/Images/pizza3.jpg'),
    Order(orderId: '1', date: 'Oct 12, 2024', total: 4999.00, status: 'Delivered', imageUrl: 'assets/Images/pizza4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            elevation: 2,
            child: ListTile(
              leading: Image.asset(
                order.imageUrl,
                width: 50, 
                height: 50, 
                fit: BoxFit.cover, 
              ),
              title: Text(
                order.status,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: order.status == 'Delivered'
                      ? Colors.green
                      : (order.status == 'Cancelled' ? Colors.red : Colors.black),
                ),
              ),
              subtitle: Text('Delivery Date: ${order.date}'),
              trailing: Text('₹${order.total.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderDetailsScreen(order: order)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Order {
  final String orderId;
  final String date;
  final double total;
  final String status;
  final String imageUrl; 

  Order({required this.orderId, required this.date, required this.total, required this.status, required this.imageUrl});
}

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.orderId}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Date: ${order.date}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Total: ₹${order.total.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Status: ${order.status}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            // Display the order image in details
            Image.asset(
              order.imageUrl,
              fit: BoxFit.cover,
              width: 200, // Fill available width
              height: 200, // Set height for image
            ),
          ],
        ),
      ),
    );
  }
}
