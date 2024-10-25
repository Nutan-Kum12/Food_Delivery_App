import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final Function(String) onSearch; 

   Searchbar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(20.0),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200], 
          labelText: 'Search',
          labelStyle: TextStyle(color: Colors.grey[700]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Icon(Icons.search, color: Colors.grey[700]),
        ),
        style:  TextStyle(color: Colors.black),
      ),
    );
  }
}
