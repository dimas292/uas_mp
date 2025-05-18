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
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gradient banner
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: 
                     [
                        colorScheme.primary, 
                        colorScheme.secondary, 
                      ]
                 ,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
          ),
          
          // Profile section with image overlap
          Transform.translate(
            offset: Offset(0, -50),
            child: Column(
              children: [
                // Circular profile image
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                SizedBox(height: 12),
                
                // Name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                ),
                
                SizedBox(height: 4),
                
                // Faculty
                Text(
                  faculty,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D3436),
                  ),
                ),
                
                SizedBox(height: 2),
                
                // Major
                Text(
                  major,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF636E72),
                  ),
                ),
                
                SizedBox(height: 16),
                
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
                            style: TextStyle(color: Colors.white, fontFamily: 'Poppins-regular'),
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
                
                // Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat(projects.toString(), 'Projects', colorScheme.primary),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    _buildStat(gpa.toString(), 'GPA', colorScheme.primary),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    _buildStat(years.toString(), 'Years', colorScheme.primary),
                  ],
                ),
                
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStat(String value, String label, dynamic colorSchemes) {


    
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colorSchemes,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF636E72),
          ),
        ),
      ],
    );
  }
}