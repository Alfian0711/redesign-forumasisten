import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../widgets/jadwal_card.dart'; // Pastikan jadwal_card.dart sudah ada

class MatkulJadwalScreen extends StatelessWidget {
  const MatkulJadwalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> scheduleData = [
      {
        'name': 'PENGENALAN TEKNOLOGI INFORMASI',
        'session': 'SESI 1 L.2.4.5.',
        'code': '24S103',
        'time': '07:00 - 08:40',
        'day': 'SELASA',
        'dosen': 'Dr. John Doe',
      },
      {
        'name': 'PENGENALAN TEKNOLOGI INFORMASI',
        'session': 'SESI 1 L.2.4.5.',
        'code': '24S103',
        'time': '10:40 - 12:20',
        'day': 'RABU',
        'dosen': 'Anggit Dwi Hartanto S.Kom, M.Kom',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jadwal Asisten",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        itemCount: scheduleData.length,
        itemBuilder: (context, index) {
          var schedule = scheduleData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ScheduleCard(
              name: schedule['name']!,
              session: schedule['session']!,
              code: schedule['code']!,
              time: schedule['time']!,
              day: schedule['day']!,
              dosen: schedule['dosen'] ?? 'Dosen Tidak Diketahui',
            ),
          );
        },
      ),
    );
  }
}
