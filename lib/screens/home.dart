import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/widgets/button_common.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../utils/colors.dart';
import '../widgets/avatarToolips.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final Color colorbg = Color.fromRGBO(3, 194, 236, 1);

  List<TargetFocus> tutorialStep1 = [];
  List<TargetFocus> tutorialStep2 = [];

  late TutorialCoachMark tutorialCoachMark1;
  // late TutorialCoachMark tutorialCoachMark2;

  GlobalKey keyAvatar = GlobalKey();
  GlobalKey keyjadwal = GlobalKey();
  GlobalKey keyQrButton = GlobalKey();

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update indeks tab yang dipilih
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupTutorials();
      _showTutorial1();
    });
    super.initState();
  }

  void _setupTutorials() {
    // Tutorial pertama
    tutorialStep1 = [
      TargetFocus(identify: "Avatar", keyTarget: keyAvatar, contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ini adalah avatar kamu!",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                   ElevatedButton(
                    onPressed: () => controller.next(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      "Lanjut",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ]),
      TargetFocus(
        identify: "Jadwal",
        keyTarget: keyjadwal,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ini Merupakan Informasi Jadwal Asisten.",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => controller.next(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      "Lanjut",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "ButtonQR",
        keyTarget: keyQrButton,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Ini adalah Presensi, Klik untuk melakukan Scan dan Manual!",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                     ElevatedButton(
                    onPressed: () => controller.next(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(
                      "Lanjut",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ];
  }

  void _showTutorial1() async {
    await Future.delayed(Duration(milliseconds: 500));

    // Pastikan target-target telah terlihat di layar

    if (keyQrButton.currentContext != null) {
      await Scrollable.ensureVisible(
        keyQrButton.currentContext!,
        duration: Duration(milliseconds: 300),
        alignment: 0.5,
      );
    }

    await Future.delayed(Duration(milliseconds: 300)); // Tambahan waktu render

    tutorialCoachMark1 = TutorialCoachMark(
      targets: tutorialStep1,
      colorShadow: Colors.black.withOpacity(0.8),
      textSkip: "Lewati",
      alignSkip: Alignment.topRight,
      onClickTarget: (target) {},
      onFinish: () {
        print('done');
      },
      onSkip: () {
        print('skip');
        return true;
      },
    );

    tutorialCoachMark1.show(context: context);
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorbg,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hallo',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 2),
            Text(
              'Alfian Ramadhan 👋',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: Container(
          key: keyAvatar,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
                'assets/gambar/chara cowo (1).png'), // ganti dgn avatar kamu
            radius: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              // Aksi ketika notifikasi ditekan
            },
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: screenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: screenWidth * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Mata Kuliah',
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Presensi & Info
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 8),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PRESENSI
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Presensi',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Column(
                            children: [
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      presensiCard(
                                          '27 | 32\nUTS | UAS', Colors.blue),
                                      presensiCard(
                                          '27 | 32\nPending', Colors.orange),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      presensiCard(
                                          '27 | 32\nDiterima', Colors.green),
                                      presensiCard(
                                          '27 | 32\nDitolak', Colors.red),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // INFO
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Info',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: screenHeight *
                                0.17, // atur tinggi sesuai kebutuhan
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/gambar/image.png'), // ganti dgn gambar kamu
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Menu
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: screenHeight *
                          0.1, // atur tinggi container supaya kotaknya pas
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          menuItem('Mata Kuliah', 'solar_book-bold',
                              AppColors.primary, context, '/matakuliah'),
                          SizedBox(width: 15),
                          menuItem('Forum Asisten', 'favicon 1', Colors.white,
                              context, '/FA'),
                          SizedBox(width: 15),
                          menuItem('Lapor Layanan', 'Vector-1', Colors.white,
                              context, '/LaporLayanan'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: screenHeight *
                          0.1, // atur tinggi container supaya kotaknya pas
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          menuItem('Sertifikat', 'Group 129', Colors.white,
                              context, '/LaporLayanan'),
                          SizedBox(width: 15),
                          menuItem('Regulasi', 'Vector', Colors.white, context,
                              '/LaporLayanan'),
                          SizedBox(width: 15),
                          menuItem('Polling Asisten', 'Subtract', Colors.white,
                              context, '/LaporLayanan'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Jadwal
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Informasi Jadwal',
                    key: keyjadwal,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Container(
                      height:
                          screenHeight * 0.32, // atur tinggi sesuai kebutuhan
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          scheduleCard('PENGENALAN TEKNOLOGI INFORMASI',
                              'SELASA', '07:00 - 08:40', colorbg, context),
                          SizedBox(width: 10),
                          scheduleCard('MACHINE LEARNING', 'RABU',
                              '10:40 - 12:20', colorbg, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 80), // padding bawah biar ga ketutup navbar
            ],
          ),
        ),
      ),

      // button qr
      floatingActionButton: GestureDetector(
        key: keyQrButton,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => Container(
                padding: EdgeInsets.all(10),
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonCommon(
                          isi: 'Presensi Manual',
                          warna: colorbg,
                          route: '/presensi_manual'),
                      ButtonCommon(
                          isi: 'Scan QR Code', warna: colorbg, route: '/qr'),
                    ],
                  ),
                ),
              ),
            );
          },
          backgroundColor: colorbg,
          child: Icon(Icons.qr_code_scanner, size: 32, color: Colors.white),
          elevation: 4,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex, // Mengatur tab yang dipilih
        onTap: _onTabTapped, // Menangani tap pada tab
      ),
    );
  }

  Widget menuItem(String title, String icon, Color? bgColor,
      BuildContext context, String route) {
    return Material(
      color: Colors.transparent,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          margin: EdgeInsets.only(left: 2),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border(
              bottom: BorderSide(color: Colors.black12, width: 1),
              top: BorderSide(color: Colors.black12, width: 1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/logo/$icon.png', // Ensure correct image path
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:
                        bgColor == Colors.white ? Colors.black : Colors.white,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget presensiCard(String text, Color borderColor) {
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

  Widget scheduleCard(
      String title, String day, String time, Color bgColor, context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.53,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1), // garis kiri
          top: BorderSide(color: Colors.black12, width: 1),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                AvatarWithTooltip(image: 'assets/gambar/chara cowo (1).png'),
                AvatarWithTooltip(image: 'assets/gambar/women.jpg'),
                SizedBox(width: 8),
                Expanded(
                  child: Text('Anggit Dwi Hartanto M.Kom',
                  overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.23,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Text(day,
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
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
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Text('Sesi 1',
                          style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 38, 38, 38),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
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
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Sesi 2',
                        style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 38, 38, 38),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(time, style: GoogleFonts.poppins(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
