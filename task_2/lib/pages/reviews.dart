import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.tertiary ,
        title: Text('Reviews',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}