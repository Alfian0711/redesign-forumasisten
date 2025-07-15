import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../screens/jadwal_screen.dart';
import '../screens/jadwal_screen.dart';
import '../utils/colors.dart';

class CustomToggleButton extends StatefulWidget {
  final String text1, text2;
  const CustomToggleButton({Key? key, required this.text1, required this.text2}) : super(key: key);

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  int _selectedIndex = 0; // Track the selected button

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ToggleButtons(
        isSelected: [ _selectedIndex == 0, _selectedIndex == 1 ],
        onPressed: (int index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
          
          if(index == 1 ){
          // Navigator.pushReplacement(context,
          // MaterialPageRoute(builder: (context) => JadwalpribadiScreen() ));
          }
          else {
            // Handle the first button action if needed
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => JadwalAsistenScreen()));
          }
        },
        borderRadius: BorderRadius.circular(15),
        selectedColor: Colors.white,
        color: AppColors.primaryLight,
        fillColor: AppColors.primary,
        constraints: BoxConstraints(
          minHeight: 35, // Set minimum height for the button
          minWidth: 100, // Set minimum width for the button
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15), // Reduced padding for thinner appearance
            child: Text(
              this.widget.text1,
              style: GoogleFonts.poppins(fontSize: 12), // Smaller font size
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15), // Reduced padding for thinner appearance
            child: Text(
              this.widget.text2,
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold), // Smaller font size
            ),
          ),
        ],
      ),
    );
  }
}
