import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/utils/colors.dart';

import '../utils/size_screen.dart';

class PresensiWidget extends StatelessWidget {
  final String matkul;
  final String kelas;
  final String jmlPresensi;
  final String route;

  PresensiWidget(
      {super.key,
      required this.matkul,
      required this.jmlPresensi,
      required this.kelas,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      width: SizeScreen.instance.screenWidth(context) * 0.78,
      height: SizeScreen.instance.screenHeight(context) * 0.12,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                matkul,
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5,),
              Text(kelas,
              style: GoogleFonts.poppins(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5,),
              Text(jmlPresensi,
              style: GoogleFonts.poppins(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, route);
          }, icon: Icon(Icons.arrow_forward_ios_outlined))
        ],
      ),
    );
  }
}
