import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reforumasisten/widgets/button_common.dart';
// import 'package:reforumasisten/utils/size_screen.dart';
import '../utils/colors.dart';

class InputJadwalPribadi extends StatefulWidget {
  @override
  State<InputJadwalPribadi> createState() => _InputJadwalPribadiState();
}

class _InputJadwalPribadiState extends State<InputJadwalPribadi> {
  bool isChecked = false;
  List<int> inputCardCount = [0]; // Simpan data, bukan widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Jadwal Asisten",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: inputCardCount.length,
              itemBuilder: (context, index) => _buildInputCard(index),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
               Expanded(
                child: ButtonCommon(isi: 'Simpan Semua Jadwal', warna: AppColors.primary, route: '/jadwal',),),
                IconButton(
                  onPressed: () {
                    setState(() {
                      inputCardCount.add(inputCardCount.length);
                    });
                  },
                  icon: Icon(Icons.add, size: 32, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputCard(int index) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tambah Jadwal Pribadi',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        inputCardCount.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.cancel, color: AppColors.error),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildInputField('Agenda'),
              SizedBox(height: 16),
              _buildDropdownField('Sesi', ['Sesi 1', 'Sesi 2', 'Sesi 3']),
              SizedBox(height: 16),
              _buildDropdownField('Hari', ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat']),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(color: AppColors.textSecondary),
          filled: true,
          fillColor: Colors.white70,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: AppColors.textSecondary),
          filled: true,
          fillColor: Colors.white70,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  child: Text(item, style: GoogleFonts.poppins()),
                  value: item,
                ))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}