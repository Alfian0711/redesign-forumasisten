import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/size_screen.dart';
import '../widgets/presensi_card.dart';
import '../widgets/threebuttonup.dart';

class Sub1Matakuliah extends StatelessWidget {
  Sub1Matakuliah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matakuliah",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        height: SizeScreen.instance.screenHeight(context),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(15),
            width: SizeScreen.instance.screenWidth(context),
            height: SizeScreen.instance.screenHeight(context) * 0.25,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Presensi',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Threebuttonup(text1: 'Detail', text2: 'Asisten', text3:'Jadwal')
                ),

                SizedBox(
                  height: 20,
                ),
                // PRESENSI
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center align the content
                    children: [
                      Wrap(
                        spacing: 3,
                        runSpacing: 8,
                        children: [
                          PresensiCard(
                            text: '27 | 32\nUTS | UAS',
                            borderColor: Colors.blue,
                          ),
                          PresensiCard(
                            text: '27 | 32\nPending',
                            borderColor: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(width: 3),
                      Wrap(
                        spacing: 3,
                        runSpacing: 8,
                        children: [
                          PresensiCard(
                            text: '27 | 32\nDiterima',
                            borderColor: Colors.green,
                          ),
                          PresensiCard(
                            text: '27 | 32\nDitolak',
                            borderColor: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15, left: 15, top: 15),
            padding: EdgeInsets.all(14),
            width: SizeScreen.instance.screenWidth(context),
            height: SizeScreen.instance.screenHeight(context) * 0.22,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Matkul :',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Semester :',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Kode Matkul :',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Jurusan :',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                     Text(
                      'Asisten Per-kelas :',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                     Text(
                      'Koordinator :',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Multimedia 2',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '3',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'WO005',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      's1-Kewirausahaan',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '3',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Asisten Praktikum',
                      style: GoogleFonts.poppins(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
