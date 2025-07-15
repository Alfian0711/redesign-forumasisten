import 'package:flutter/material.dart';
import 'package:reforumasisten/screens/home.dart';
import 'package:reforumasisten/screens/login.dart';
import 'package:reforumasisten/screens/memberFA_screen.dart';
import 'package:reforumasisten/screens/presensi_manual_screen.dart';
import 'package:reforumasisten/screens/profile_screen.dart';
import 'package:reforumasisten/screens/riwayatpresensi_screen.dart';
import 'package:reforumasisten/screens/splash.dart';

import 'screens/detail_riwayat_presensi.dart';
import 'screens/jadwal_screen.dart';
import 'screens/lapor_screen.dart';
import 'screens/matakuliah_screen.dart';
import 'screens/qr_scanner_screen.dart';
import 'screens/tambah_jadwal_pribadi.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => HomeScreen(),
        '/profile':(context) => ProfileScreen(),
        '/jadwal': (context) => JadwalAsistenScreen(),
        '/FA': (context) => PengurusPage(),
        '/riwayat': (context) => Riwayatpresensi(),
        '/matakuliah': (context) => MatakuliahScreen(),
        '/qr': (context) => QRScannerScreen(),
        '/LaporLayanan': (context) => LaporLayananScreen(),
        '/tambah_jadwal_pribadi': (context) => InputJadwalPribadi(),
        '/presensi_manual' : (context) => PresensiManual(),
        '/detail_riwayat_presensi': (context) => DetailRiwayatPresensi(),
      },
    );
  }
  
}