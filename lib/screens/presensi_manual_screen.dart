import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/widgets/button_common.dart';

import '../utils/colors.dart';
import '../widgets/buttonsmall.dart';

class PresensiManual extends StatefulWidget {
  @override
  State<PresensiManual> createState() => _PresensiManualState();
}

class _PresensiManualState extends State<PresensiManual> {
  int selectedTab = 0;
  String? selectedMatkul;
  String? selectedSesi;
  bool isDosenMasuk = false;
  TextEditingController alasanController = TextEditingController();
  DateTime? selectedDate;
  String? fileName;
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Color(0xFF22C6F9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Presensi Manual',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle UTS/UAS

            Center(
                child: CustomToggleButton(
                    text1: 'Presensi UTS', text2: 'Presensi UAS')),

            SizedBox(height: 24),

            // Mata Kuliah
            Text(
              'MATA KULIAH',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),
            DropdownButtonFormField<String>(
              decoration: _inputDecoration(),
              value: selectedMatkul,
              items: [
                'Matkul 1',
                'Matkul 2',
                'Matkul 3',
              ]
                  .map((e) => DropdownMenuItem(
                        child: Text(e, style: GoogleFonts.poppins()),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) => setState(() => selectedMatkul = val),
            ),
            SizedBox(height: 18),

            // Sesi
            Text(
              'SESI',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),
            DropdownButtonFormField<String>(
              decoration: _inputDecoration(),
              value: selectedSesi,
              items: [
                'MACHINE LEARNING',
                'METODOLOGI PENELITIAN',
                'PENGANTAR TEKNOLOGI INFORMASI',
              ]
                  .map((e) => DropdownMenuItem(
                        child:
                            Text(e, style: GoogleFonts.poppins(fontSize: 14)),
                        value: e,
                      ))
                  .toList(),
              onChanged: (val) => setState(() => selectedSesi = val),
            ),
            SizedBox(height: 8),

            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: isDosenMasuk,
                  onChanged: (val) => setState(() => isDosenMasuk = val!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  activeColor: Color(0xFF22C6F9),
                ),
                Text(
                  'APAKAH DOSEN MASUK?',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Alasan Manual
            Text(
              'ALASAN MANUAL',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),
            TextField(
              controller: alasanController,
              maxLines: 3,
              decoration: _inputDecoration(),
            ),
            SizedBox(height: 18),

            // Tanggal Asistensi
            Text(
              'TANGGAL ASISTENSI',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),
            GestureDetector(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (picked != null) setState(() => selectedDate = picked);
              },
              child: AbsorbPointer(
                child: TextField(
                  decoration: _inputDecoration().copyWith(
                    hintText: selectedDate == null
                        ? 'TANGGAL ASISTENSI'
                        : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                    prefixIcon: Icon(Icons.calendar_today, size: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),

            // Upload Bukti Manual
            Text(
              'UPLOAD BUKTI MANUAL',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // Implementasi file picker sesuai kebutuhan
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.image,
                    );
                    if (result != null && result.files.single.path != null) {
                      setState(() {
                        _pickedImage = File(result.files.single.path!);
                        fileName = result.files.single.name;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Pilih file',
                      style: GoogleFonts.poppins(fontSize: 13)),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      fileName ?? 'Tidak ada file yang dipilih',
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            if (_pickedImage != null)
              Padding(
                padding: EdgeInsets.only(top: 12, bottom: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _pickedImage!,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              child: ButtonCommon(
                isi: 'Kirim',
                warna: AppColors.primary,
                route: '/',
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFF22C6F9)),
      ),
      hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
    );
  }
}
