import 'package:flutter/material.dart';

class DivisiCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  DivisiCard({super.key, required this.name, required this.role, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Width of each card
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.asset(
              imageUrl, // Use the image path here
              width: 80, // Adjust image size
              height: 80, // Adjust image size
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Text(
            role,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}