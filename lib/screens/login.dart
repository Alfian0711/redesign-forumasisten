import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final colorbg = Color.fromRGBO(3, 194, 236, 1);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorbg,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Bagian atas gambar
          Container(
            padding: EdgeInsets.only(top: screenHeight * 0.06),
            child: Image(
              image: AssetImage('assets/gambar/Frame 119.png'),
              width: screenWidth * 0.75,
            ),
          ),

          // Bagian putih dengan input form
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.10,
                  vertical: screenHeight * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo + Welcome Text
                    Center(
                      child: Column(
                        children: [
                          Image.asset('assets/logo/Logo.png',
                              height: screenHeight * 0.05),
                          SizedBox(height: screenHeight * 0.015),
                          Text(
                            'Selamat Datang',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Silahkan masuk dengan akun Amikom',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.035,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Input NIM
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'NIM',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5, // atur supaya input box lebih tipis
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    // Input Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'PASSWORD',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5, // atur supaya input box lebih tipis
                        ),
                      ),
                    ),

                    SizedBox(height: 24),

                    // Tombol Masuk
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorbg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Tampilkan tutorial intro dan arahkan ke HomeScreen
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Text(
                          'Masuk',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    // Tombol Lapor Asisten
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorbg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Lapor Asisten',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
