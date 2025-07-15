import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/size_screen.dart';
import '../widgets/profile_card.dart';
import '../widgets/contact_info_card.dart';
import '../widgets/menu_item.dart';
import '../utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Profile',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            // Profile Card
            ProfileCard(
              name: 'ARIEFHAN MAULANA',
              studentId: '22.95.0387',
              major: 'SI-Sistem Informasi',
              onEditTap: () => _handleEditProfile(context),
            ),

            SizedBox(height: 24),

            // Contact Information
            ContactInfoCard(
              email: 'email@gmail.com',
              phoneNumber: '0812 3456 7891',
            ),

            SizedBox(height: 30),

            // Menu Items
            MenuItem(
              icon: Icons.help_center_outlined,
              title: 'Help Center',
              onTap: () => _handleHelpCenter(context),
            ),

            SizedBox(height: 12),

            MenuItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () => _handleLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  // Event Handlers
  void _handleEditProfile(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Edit Fitur Under Development', style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: AppColors.error,
      ),
    );
  }

  void _handleHelpCenter(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Fitur under Development', style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: AppColors.error,
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          title: Container(
            padding: EdgeInsets.all(10),
            width: SizeScreen.instance.screenWidth(context),
            height: SizeScreen.instance.screenHeight(context)*0.06, // Adjust height as needed
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(
                color: AppColors.background,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          content: Text(
            'Apakah Anda yakin ingin logout?',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Container(
                width: SizeScreen.instance.screenHeight(context)*0.1,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Batal',
                  style: GoogleFonts.poppins(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logout berhasil'),
                    backgroundColor: AppColors.success,
                  ),
                );
              },
              child: Container(
                width: SizeScreen.instance.screenHeight(context)*0.1,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
