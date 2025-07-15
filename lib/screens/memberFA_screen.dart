import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/utils/colors.dart';
import 'package:reforumasisten/utils/size_screen.dart';

import '../widgets/divisiFA.dart';
import '../widgets/penguruscard.dart';

class PengurusPage extends StatefulWidget {
  @override
  State<PengurusPage> createState() => _PengurusPageState();
}

class _PengurusPageState extends State<PengurusPage> {
  final ScrollController _divisiAController = ScrollController();
  double _divisiASliderValue = 0.0;

  final ScrollController _divisiBController = ScrollController();
  double _divisiBSliderValue = 0.0;

  @override
  void dispose() {
    _divisiAController.dispose();
    _divisiBController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text("Pengurus Forum Asisten",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pengurus Inti Section
              Text(
                'Pengurus Inti',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PengurusCard(
                    imageUrl: 'assets/gambar/15 1.png',
                    name: 'Ariefhan Maulana',
                    role: 'Chairman',
                  ),
                  PengurusCard(
                    imageUrl: 'assets/gambar/15 1.png',
                    name: 'Ariefhan Maulana',
                    role: 'Vice Chairman',
                  ),
                ],
              ),
              SizedBox(height: 32),

              // Divisi A Section with Slider
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Divisi A',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: Column(
                      children: [
                        NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            if (scrollNotification.metrics.maxScrollExtent == 0) return false;
                            setState(() {
                              _divisiASliderValue = scrollNotification.metrics.pixels /
                                  scrollNotification.metrics.maxScrollExtent;
                            });
                            return true;
                          },
                          child: SizedBox(
                            height: SizeScreen.instance.screenHeight(context) * 0.18,
                            child: ListView(
                              controller: _divisiAController,
                              scrollDirection: Axis.horizontal,
                              children: [
                                DivisiCard(
                                  name: 'Alfian Ramadhan',
                                  role: 'Ketua Divisi A',
                                  imageUrl: 'assets/gambar/15 1.png',
                                ),
                                DivisiCard(
                                  name: 'Alfian Ramadhan',
                                  role: 'Anggota Divisi A',
                                  imageUrl: 'assets/gambar/15 1.png',
                                ),
                                DivisiCard(
                                  name: 'Alfian Ramadhan',
                                  role: 'Anggota Divisi A',
                                  imageUrl: 'assets/gambar/15 1.png',
                                ),
                                // Tambahkan DivisiCard lain jika perlu
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double sliderWidth = constraints.maxWidth - 40;
                            return Row(
                              children: [
                                Icon(Icons.arrow_left, color: Colors.blue, size: 20),
                                Container(
                                  width: sliderWidth,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Stack(
                                    children: [
                                      FractionallySizedBox(
                                        widthFactor: _divisiASliderValue.clamp(0.0, 1.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(Icons.arrow_right, color: Colors.blue, size: 20),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // Divisi B Section with Slider
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Divisi B',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: Column(
                      children: [
                        NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            if (scrollNotification.metrics.maxScrollExtent == 0) return false;
                            setState(() {
                              _divisiBSliderValue = scrollNotification.metrics.pixels /
                                  scrollNotification.metrics.maxScrollExtent;
                            });
                            return true;
                          },
                          child: SizedBox(
                            height: SizeScreen.instance.screenHeight(context) * 0.18,
                            child: ListView(
                              controller: _divisiBController,
                              scrollDirection: Axis.horizontal,
                              children: [
                                DivisiCard(
                                  name: 'Alfian Ramadhan',
                                  role: 'Ketua Divisi B',
                                  imageUrl: 'assets/gambar/15 1.png',
                                ),
                                DivisiCard(
                                  name: 'Alfian Ramadhan',
                                  role: 'Anggota Divisi B',
                                  imageUrl: 'assets/gambar/15 1.png',
                                ),
                                DivisiCard(
                                  name: 'Alfian Ramadhan',
                                  role: 'Anggota Divisi B',
                                  imageUrl: 'assets/gambar/15 1.png',
                                ),
                                // Tambahkan DivisiCard lain jika perlu
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            double sliderWidth = constraints.maxWidth - 40;
                            return Row(
                              children: [
                                Icon(Icons.arrow_left, color: Colors.blue, size: 20),
                                Container(
                                  width: sliderWidth,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Stack(
                                    children: [
                                      FractionallySizedBox(
                                        widthFactor: _divisiBSliderValue.clamp(0.0, 1.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(Icons.arrow_right, color: Colors.blue, size: 20),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}