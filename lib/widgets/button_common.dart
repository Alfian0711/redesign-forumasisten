import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCommon extends StatelessWidget {
  final String isi;
  final Color warna;
  final String route;
  const ButtonCommon({super.key, required this.isi, required this.warna, required this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        } ,
        style: ElevatedButton.styleFrom(
          backgroundColor: warna,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          isi,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      );
  }
}
