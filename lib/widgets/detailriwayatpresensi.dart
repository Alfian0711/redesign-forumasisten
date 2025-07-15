
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatPresensiTile extends StatelessWidget {
  final bool diterima;
  final String tanggal;
  final String waktu;
  final String tanggalFull;
  final String? alasan;
  final bool isGrey;

  const RiwayatPresensiTile({
    required this.diterima,
    required this.tanggal,
    required this.waktu,
    required this.tanggalFull,
    this.alasan,
    this.isGrey = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isGrey ? Colors.grey[200] : Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon status
          Container(
            margin: EdgeInsets.only(top: 2),
            child: CircleAvatar(
              backgroundColor: diterima ? Colors.green : Colors.red,
              radius: 16,
              child: Icon(
                diterima ? Icons.check : Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(width: 12),
          // Detail presensi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  diterima ? "Presensi Diterima" : "Presensi Ditolak",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: diterima ? Colors.black : Colors.red[700],
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  diterima
                      ? "Presensi anda pada tanggal $tanggal telah diterima"
                      : "Presensi anda pada tanggal $tanggal telah ditolak dengan alasan \"${alasan ?? '-'}\"",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      waktu,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      tanggalFull,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}