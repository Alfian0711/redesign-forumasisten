import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // Menyimpan index yang dipilih
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = _currentIndex;  // Mendapatkan index dari parent
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onTap(index);  // Menangani klik dan memberi tahu parent
    if(index == 1){
      Navigator.pushNamed(context, '/jadwal').then((_){
        setState(() {
          _currentIndex = 0; // Kembali ke Home setelah navigasi
        });
      });
    }else if(index == 3){
      Navigator.pushNamed(context, '/riwayat').then((_){
        setState(() {
          _currentIndex = 0; // Kembali ke Home setelah navigasi
        });
      });
    }else if(index == 4){
      Navigator.pushNamed(context, '/profile').then((_){
        setState(() {
          _currentIndex = 0; // Kembali ke Home setelah navigasi
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 20, left: 20 ), // Memberikan margin untuk efek melayang
      decoration: BoxDecoration(
        color: Colors.white, // Ganti background menjadi putih
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white, // Ganti background menjadi putih
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavItem(
                iconPath: 'assets/logo/mingcute_home-7-line.png',
                isSelected: _currentIndex == 0,
              ),
              activeIcon: _buildNavItem(
                iconPath: 'assets/logo/mingcute_home-7-line.png',
                isSelected: true,
              ),
              label: 'Home'
            ),

            BottomNavigationBarItem(
              icon: _buildNavItem(
                iconPath: 'assets/logo/solar_calendar-bold.png',
                isSelected: _currentIndex == 1,
              ),
              activeIcon: _buildNavItem(
                iconPath: 'assets/logo/solar_calendar-bold.png',
                isSelected: true,
              ),
              label: 'Jadwal',
            ),

            BottomNavigationBarItem(
              icon:SizedBox.shrink(),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: _buildNavItem(
                iconPath: 'assets/logo/streamline_fastforward-clock-solid.png',
                isSelected: _currentIndex == 3,
              ),
              activeIcon: _buildNavItem(
                iconPath: 'assets/logo/streamline_fastforward-clock-solid.png',
                isSelected: true,
              ),
              label: 'Riwayat', 
            ),

            BottomNavigationBarItem(
              icon: _buildNavItem(
                iconPath: 'assets/logo/iconamoon_profile.png',
                isSelected: _currentIndex == 4,
              ),
              activeIcon: _buildNavItem(
                iconPath: 'assets/logo/iconamoon_profile.png',
                isSelected: true,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required String iconPath, required bool isSelected}) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.transparent, // Ubah background saat terpilih
        borderRadius: BorderRadius.circular(15),
      ),
      child: ImageIcon(
        size: 35,
        AssetImage(iconPath),
        color: isSelected ? Colors.white : Colors.grey, // Ubah warna icon
      ),
    );
  }
}
