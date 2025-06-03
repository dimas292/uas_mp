import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String faculty;
  final String major;
  final String quote;
  final int projects;
  final double gpa;
  final int years;
  final List<Map<String, dynamic>> hobbies;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.faculty,
    required this.major,
    required this.quote,
    required this.projects,
    required this.gpa,
    required this.years,
    required this.hobbies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Stack untuk banner dan profile image
          Stack(
            clipBehavior: Clip.none, // Penting: izinkan overflow
            children: [
              // Background Banner
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: Image.asset(
                    'assets/images/bc.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),

              // Profile Image - posisi di tengah bawah banner
              Positioned(
                bottom: -75, // Setengah dari tinggi CircleAvatar (150/2)
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 71, // (150-8)/2 untuk border
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Spacing untuk memberi ruang pada profile image yang overlap
          SizedBox(height: 95), // 75 + 20 untuk spacing

          // Hobbies pills
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: hobbies.map((hobby) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: hobby['color'],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(hobby['icon'], size: 16, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      hobby['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins-regular',
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 20),

          // Bio quote
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '"$quote"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Color(0xFF2D3436),
              ),
            ),
          ),

          SizedBox(height: 20),

          // Info rows
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoItem("Nama Lengkap", name),
                      _buildInfoItem("Nama Panggilan", name),
                      _buildInfoItem("NPM", "237064516010"),
                      _buildInfoItem("Program Studi", "Informatika"),
                      _buildInfoItem("Fakultas", "Teknologi Komunikasi dan Informatika"),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoItem("Alamat", "Jakarta, Indonesia"),
                      _buildInfoItem("Moto Hidup", "Jika tidak suka belajar, Maka belajarlah menyukainya"),
                      _buildInfoItem("Hobi", "Membaca, Volly"),
                      _buildInfoItem("Matakuliah yang Disukai", "Algoritma dan Struktur Data"),
                      _buildInfoItem("Pendidikan Terakhir", "SMK"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2D3436),
            ),
          ),
        ],
      ),
    );
  }
}