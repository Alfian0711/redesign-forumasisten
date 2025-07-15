import 'package:flutter/material.dart';

class ShortBottom extends StatelessWidget {
  final Color color;
  final Widget destination;
  final String text;
  
  ShortBottom({super.key, required this.color, required this.destination, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}