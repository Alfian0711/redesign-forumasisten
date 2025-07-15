import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/utils/colors.dart';
import 'package:reforumasisten/utils/size_screen.dart';
import 'package:reforumasisten/widgets/button_common.dart';
import '../widgets/jadwal_card.dart';
import '../widgets/jadwalpribadi_card.dart';
import '../widgets/day_button.dart';

class JadwalAsistenScreen extends StatefulWidget {
  JadwalAsistenScreen({super.key});

  @override
  State<JadwalAsistenScreen> createState() => _JadwalAsistenScreenState();
}

class _JadwalAsistenScreenState extends State<JadwalAsistenScreen> {
  int _selectedIndex = 0;
  bool isExpanded = false;
    bool isDayButtonActive = false; // Status aktif DayButton

  late List<Map<String, String>> allSchedule = [
    {
      'name': 'Metodologi Penelitian',
      'session': 'Sesi 2',
      'code': 'PM123',
      'time': '08:00 - 10:00',
      'day': 'Senin',
      'dosen': 'Anggit Dwi Hartanto M.Kom',
    },
    {
      'name': 'Machine Learning',
      'session': 'Sesi 3',
      'code': 'AI456',
      'time': '10:00 - 12:00',
      'day': 'Rabu',
      'dosen': 'Yoga Prasetyo M.Kom',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text(
          'Jadwal Pribadi',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: SizeScreen.instance.screenHeight(context),
            width: SizeScreen.instance.screenWidth(context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  Center(
                    child: CustomToggleButton(
                      text1: 'Jadwal Asisten',
                      text2: 'Jadwal Pribadi',
                      onSelected: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      selectedIndex: _selectedIndex,
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: _selectedIndex == 0
                        ? _buildAsistenContent()
                        : _buildPribadiContent(),
                  ),
                  ButtonCommon(
                      isi: 'Tambah Jadwal Pribadi',
                      warna: AppColors.primary,
                      route: '/tambah_jadwal_pribadi'),
                ],
              ),
            ),
          ),
          // Ini posisi DayButton
          Positioned(
            right: 10,
            bottom: SizeScreen.instance.screenHeight(context) * 0.05,
            child: DayButton(
              scheduleData: allSchedule,
              isExpanded: isDayButtonActive,
              onToggle: () {
                setState(() {
                  isDayButtonActive = !isDayButtonActive;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAsistenContent() {
    return Expanded(
      child: AnimatedPadding(
          padding: EdgeInsets.only(
                      right: isDayButtonActive ? 70 : 0, // beri space saat aktif
                    ),

        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
        child: ListView(
          shrinkWrap: true,
          children: allSchedule.map((schedule) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ScheduleCard(
                name: schedule['name']!,
                session: schedule['session']!,
                code: schedule['code']!,
                time: schedule['time']!,
                day: schedule['day']!,
                dosen: schedule['dosen'] ?? 'Dosen Tidak Diketahui',
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPribadiContent() {
    return ListView(
      children: [
        JadwalPribadiCard(
          title: 'Jadwal Pribadi',
          name: 'RAPAT RUTIN EC',
          day: 'SELASA',
          session: 'SESI 1',
        ),
        JadwalPribadiCard(
          title: 'Jadwal Pribadi',
          name: 'KELAS METOPEN',
          day: 'SELASA',
          session: 'SESI 1',
        ),
      ],
    );
  }
}

class CustomToggleButton extends StatelessWidget {
  final String text1, text2;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const CustomToggleButton({
    required this.text1,
    required this.text2,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: [selectedIndex == 0, selectedIndex == 1],
      onPressed: (index) => onSelected(index),
      borderRadius: BorderRadius.circular(15),
      selectedColor: Colors.white,
      color: AppColors.primaryLight,
      fillColor: AppColors.primary,
      constraints: BoxConstraints(minHeight: 35, minWidth: 120),
      children: [
        Text(text1, style: GoogleFonts.poppins(fontSize: 13)),
        Text(text2, style: GoogleFonts.poppins(fontSize: 13)),
      ],
    );
  }
}
