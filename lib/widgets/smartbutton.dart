import 'package:flutter/material.dart';

class Smartbutton extends StatefulWidget {
  @override
  _SmartbuttonState createState() => _SmartbuttonState();
}

class _SmartbuttonState extends State<Smartbutton> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(right: 10, bottom: 20),
          height: 400,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNavItem(Icons.home_outlined, 0),
              _buildNavItem(Icons.calendar_today_outlined, 1),
              _buildNavItem(Icons.access_time_outlined, 2),
              _buildNavItem(Icons.person_outline, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });

        // Tampilkan konten yang sesuai saat diklik
        _showBottomSheet(index);
      },
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: _currentIndex == index ? Colors.blue : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: _currentIndex == index ? Colors.white : Colors.black,
          size: 30,
        ),
      ),
    );
  }

  void _showBottomSheet(int index) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        switch (index) {
          case 0:
            return _buildSheetContent("Beranda", Icons.home_outlined);
          case 1:
            return _buildSheetContent("Kalender", Icons.calendar_today_outlined);
          case 2:
            return _buildSheetContent("Jam", Icons.access_time_outlined);
          case 3:
            return _buildSheetContent("Profil", Icons.person_outline);
          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildSheetContent(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 200,
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, size: 28),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 10),
          Text("Ini adalah konten untuk $title."),
        ],
      ),
    );
  }
}
