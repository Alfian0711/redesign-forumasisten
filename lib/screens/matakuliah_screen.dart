import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/screens/sub1_matakuliah.dart';
import 'package:reforumasisten/utils/colors.dart';

class MatakuliahScreen extends StatelessWidget {
  MatakuliahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Mata Kuliah',
          style: GoogleFonts.poppins(
            color: Colors.white, // Ubah teks jadi hitam
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Sub1Matakuliah(),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Card diklik!')),
            );
          },
          child: SizedBox(
            height: 200,
            child: Card(
              color: AppColors.primary, // Tetap biru untuk card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/gambar/ankkecil.png',
                        height: 80,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sistem Informasi',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Rancangan Perangkat Lunak',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: 16, color: Colors.white70),
                            SizedBox(width: 4),
                            Text(
                              '10:30 AM',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.white70),
                            ),
                            SizedBox(width: 14),
                            Icon(Icons.event_seat,
                                size: 16, color: Colors.white70),
                            SizedBox(width: 4),
                            Text(
                              '15 Asisten',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
