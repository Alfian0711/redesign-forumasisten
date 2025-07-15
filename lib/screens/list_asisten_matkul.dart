import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/size_screen.dart';
import '../widgets/threebuttonup.dart';

class ListAsistenMatkul extends StatefulWidget {
 ListAsistenMatkul({super.key});

  @override
  State<ListAsistenMatkul> createState() => _ListAsistenMatkulState();
}

class _ListAsistenMatkulState extends State<ListAsistenMatkul> {
  final List<Map<String, String>> asistenList = [
    {
      'nama': 'ASISTEN PRAKTIKUM 1',
      'nim': '22.XX.XXXX',
      'foto': 'assets/gambar/chara cowo (1).png',
    },
    {
      'nama': 'ASISTEN PRAKTIKUM 2',
      'nim': '22.XX.XXXX',
      'foto': 'assets/gambar/chara cowo (1).png',
    },
    {
      'nama': 'ASISTEN PRAKTIKUM 3',
      'nim': '22.XX.XXXX',
      'foto': 'assets/gambar/chara cowo (1).png',
    },
    {
      'nama': 'ASISTEN PRAKTIKUM 4',
      'nim': '22.XX.XXXX',
      'foto': 'assets/gambar/chara cowo (1).png',
    },
  ];

  // Untuk menyimpan index yang sedang terbuka
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFF),
      appBar: AppBar(
        title: Text(
          "Kewirausahaan",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF22C6F9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(15),
              width: SizeScreen.instance.screenWidth(context),
              height: SizeScreen.instance.screenHeight(context) * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Presensi',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 SizedBox(height: 5),
                  Center(child: Threebuttonup(text1: 'Detail', text2: 'Asisten', text3:'Jadwal')),
                 SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: asistenList.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[300],
                  height: 0,
                  thickness: 1,
                  indent: 12,
                  endIndent: 12,
                ),
                itemBuilder: (context, index) {
                  final asisten = asistenList[index];
                  final isExpanded = expandedIndex == index;

                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage(asisten['foto']!),
                        ),
                        title: Text(
                          asisten['nama']!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          asisten['nim']!,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                        ),
                        trailing: Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.grey[600],
                        ),
                        onTap: () {
                          setState(() {
                            expandedIndex = isExpanded ? null : index;
                          });
                        },
                      ),

                      /// bagian dropdown
                      AnimatedCrossFade(
                        duration: Duration(milliseconds: 300),
                        firstChild: SizedBox.shrink(),
                        secondChild: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email: ${asisten['nim']}@student.amikom.ac.id',
                                style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[800]),
                              ),
                             SizedBox(height: 4),
                              Text(
                                'No HP: 08xx-xxxx-xxxx',
                                style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[800]),
                              ),
                            ],
                          ),
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
