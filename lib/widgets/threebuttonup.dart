import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/screens/list_asisten_matkul.dart';
import 'package:reforumasisten/screens/matkul_jadwal_screen.dart';
import '../utils/colors.dart';

class Threebuttonup extends StatefulWidget {
  final String text1, text2, text3;

  const Threebuttonup({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);

  @override
  _ThreebuttonupState createState() => _ThreebuttonupState();
}

class _ThreebuttonupState extends State<Threebuttonup> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: [
        _selectedIndex == 0,
        _selectedIndex == 1,
        _selectedIndex == 2,
      ],
      onPressed: (int index) {
        setState(() {
          _selectedIndex = index;
        });

        // Arahkan ke halaman berdasarkan index
        switch (index) {
          case 0:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ListAsistenMatkul()),
            // );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListAsistenMatkul()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MatkulJadwalScreen()),
            );
            break;
        }
      },
      borderRadius: BorderRadius.circular(15),
      selectedColor: Colors.white,
      color: AppColors.primaryLight,
      fillColor: AppColors.primary,
      constraints: const BoxConstraints(
        minHeight: 35,
        minWidth: 100,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            widget.text1,
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            widget.text2,
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            widget.text3,
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
