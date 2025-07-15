import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/utils/size_screen.dart';
import 'package:reforumasisten/widgets/presensi_widget.dart';

import '../utils/colors.dart';
import '../widgets/buttonsmall.dart';
import '../widgets/presensi_card.dart';

class Riwayatpresensi extends StatelessWidget {
  const Riwayatpresensi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          title: Text("Presensi Asisten",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
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
          child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                    child: CustomToggleButton(
                        text1: 'Presensi UTS', text2: 'Presensi UAS'),
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
            PresensiWidget(
              matkul: 'Pengantar Teknologi Informasi',
              kelas: '24D3TI01',
              jmlPresensi: 'Jumlah Presensi : 27',
              route: '/detail_riwayat_presensi',
            ),
            SizedBox(
              height: 20,
            ),
            PresensiWidget(
              matkul: 'Pengantar Teknologi Informasi',
              kelas: '24D3TI01',
              jmlPresensi: 'Jumlah Presensi : 27',
              route: '/detail_riwayat_presensi',
            ),
            SizedBox(
              height: 20,
            ),
            PresensiWidget(
              matkul: 'Pengantar Teknologi Informasi',
              kelas: '24D3TI01',
              jmlPresensi: 'Jumlah Presensi : 27',
              route: '/detail_riwayat_presensi',
            ),
          ]),
        )));
  }
}
