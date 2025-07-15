import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String studentId;
  final String major;
  final VoidCallback? onEditTap;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.studentId,
    required this.major,
    this.onEditTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image
          _buildProfileImage(),
          const SizedBox(width: 12),
          // Profile Info
          Container(
            child: _buildProfileInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.profileImageBg,
      ),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name with Edit Icon
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
           SizedBox(width: 8),
            GestureDetector(
              onTap: onEditTap,
              child: Icon(
                Icons.edit,
                size: 16,
                color: AppColors.iconBlue,
              ),
            ),
          ],
        ),
       SizedBox(height: 4),
        // Student ID
        Text(
          studentId,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
       SizedBox(height: 8),
        // Major Badge
        Row(
          children: [
            Icon(
              Icons.school,
              size: 16,
              color: Colors.grey[600],
            ),
           SizedBox(width: 4),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                major,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}