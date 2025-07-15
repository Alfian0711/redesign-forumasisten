import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PresensiCard extends StatelessWidget {
  final String text;
  final Color borderColor;

  // Constructor to accept text and border color
  const PresensiCard({
    Key? key,
    required this.text,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
