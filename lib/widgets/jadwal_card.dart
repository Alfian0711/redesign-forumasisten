import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/utils/size_screen.dart';
import 'package:reforumasisten/widgets/avatarToolips.dart';

import '../utils/colors.dart';

class ScheduleCard extends StatelessWidget {
  final String name;
  final String session;
  final String code;
  final String time;
  final String day;
  final String dosen;

  ScheduleCard({
    required this.name,
    required this.session,
    required this.code,
    required this.time,
    required this.day,
    required this.dosen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          vertical: 10, horizontal: 15), // Add horizontal margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: SizeScreen.instance.screenWidth(context),
            height: SizeScreen.instance.screenHeight(context) *
                0.07, // Adjust height as needed
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    AvatarWithTooltip(image: 'assets/gambar/15 1.png'),
                    AvatarWithTooltip(image: 'assets/gambar/women.jpg'),
                  ],
                ),
                SizedBox(width: 20), // Add space between avatars and text
                Flexible(
                  child: Text(
                    dosen,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Prevent text overflow
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, // Prevent text overflow
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.black12, width: 1), // garis kiri
                      top: BorderSide(color: Colors.black12, width: 1),
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4),
                    ],
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Text(day,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.23,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.black12, width: 1), // garis kiri
                          top: BorderSide(color: Colors.black12, width: 1),
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(session,
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 38, 38, 38),
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.23,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.black12, width: 1), // garis kiri
                          top: BorderSide(color: Colors.black12, width: 1),
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('2.4.1',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 38, 38, 38),
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.black12, width: 1), // garis kiri
                            top: BorderSide(color: Colors.black12, width: 1),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 4),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(code,
                            style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 38, 38, 38),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(time,
                  overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 38, 38, 38),
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
