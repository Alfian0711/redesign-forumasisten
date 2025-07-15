import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import '../widgets/bottom_nav_bar.dart';

class QRScannerScreen extends StatefulWidget {
  QRScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  int _currentIndex = 2; // Index untuk tab Scan
  bool _isScanning = false;
  String _scanResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Scan QR Code',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _startQRScanner,
        backgroundColor: AppColors.primary,
        child: Icon(
          _isScanning ? Icons.stop : Icons.qr_code_scanner,
          size: 32,
          color: Colors.white,
        ),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            
            // Scanner Area
            Expanded(
              child: _buildScannerArea(),
            ),
            
            SizedBox(height: 5),
            
            // Result Section
            if (_scanResult.isNotEmpty) _buildResultSection(),
            
            SizedBox(height: 100), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildScannerArea() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Scanner Preview Area
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: _isScanning ? AppColors.primary.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: _isScanning ? AppColors.primary : Colors.grey.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                // Corner indicators
                Positioned(
                  top: 10,
                  left: 10,
                  child: _buildCornerIndicator(),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Transform.rotate(
                    angle: 1.5708, // 90 degrees
                    child: _buildCornerIndicator(),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Transform.rotate(
                    angle: -1.5708, // -90 degrees
                    child: _buildCornerIndicator(),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Transform.rotate(
                    angle: 3.14159, // 180 degrees
                    child: _buildCornerIndicator(),
                  ),
                ),
                
                // Center content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        size: 80,
                        color: _isScanning ? AppColors.primary : Colors.grey,
                      ),
                      SizedBox(height: 15),

                      GestureDetector(
                        onTap: _startQRScanner,
                        child: Text(
                          _isScanning ? 'Scanning...' : 'Tap to Start Scanning',
                          style: TextStyle(
                            fontSize: 16,
                            color: _isScanning ? AppColors.primary : AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (_isScanning) ...[
                        SizedBox(height: 10),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 50),
          
          // Instructions
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Scan the QR code provider by your teacher',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerIndicator() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.primary, width: 3),
          left: BorderSide(color: AppColors.primary, width: 3),
        ),
      ),
    );
  }

  Widget _buildResultSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle, color: AppColors.primary, size: 20),
              SizedBox(width: 8),
              Text(
                'Scan Result',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              _scanResult,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _copyToClipboard,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Copy'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: _clearResult,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Clear',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Event Handlers
  void _startQRScanner() {
    setState(() {
      if (_isScanning) {
        _isScanning = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Scanning dihentikan'),
            backgroundColor: AppColors.primary,
          ),
        );
      } else {
        _isScanning = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Memulai scan QR Code...'),
            backgroundColor: AppColors.primary,
          ),
        );
        
        // Simulasi hasil scan setelah 3 detik
        Future.delayed(Duration(seconds: 3), () {
          if (_isScanning) {
            setState(() {
              _isScanning = false;
              _scanResult = 'https://example.com/attendance/check-in/student/12345';
            });
            
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('QR Code berhasil di-scan!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        });
      }
    });
  }

  void _copyToClipboard() {
    // Implementasi copy to clipboard
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Hasil scan disalin ke clipboard'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _clearResult() {
    setState(() {
      _scanResult = '';
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pop(context); // Kembali ke Home
        break;
      case 1:
        _navigateToJadwal();
        break;
      case 2:
        // Already on Scanner
        break;
      case 3:
        _navigateToRiwayat();
        break;
      case 4:
        _navigateToProfile();
        break;
    }
  }

  void _navigateToJadwal() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigasi ke Jadwal'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _navigateToRiwayat() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigasi ke Riwayat'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _navigateToProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigasi ke Profile'),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}