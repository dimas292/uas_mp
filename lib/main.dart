import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portofolio/components/card.dart';
import 'package:portofolio/features/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

final List<Color> seedColors = [
  Colors.lightGreenAccent,
  Colors.purpleAccent,
  Colors.blueAccent,
  Colors.redAccent,
  Colors.amberAccent,
  Colors.tealAccent,
  Colors.pinkAccent,
  Colors.cyanAccent,
  Colors.deepOrangeAccent,
  Colors.indigoAccent,
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  Color currentSeedColor = seedColors[0]; 


  void changeThemeColor() {
    setState(() {
      // Pilih warna acak dari daftar, pastikan tidak sama dengan warna sebelumnya
      Color newColor;
      do {
        newColor = seedColors[Random().nextInt(seedColors.length)];
      } while (newColor == currentSeedColor && seedColors.length > 1);
      
      currentSeedColor = newColor;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: currentSeedColor,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portofolio.me',

      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,

      ),
      
      routes: {
        '/' : (context) => SplashScreen(),
        '/home' : (context) => MyHomeApps(onChangeTheme: changeThemeColor)
      },
    );
  }
}

class MyHomeApps extends StatelessWidget {
  final VoidCallback onChangeTheme; 
  const MyHomeApps({super.key, required this.onChangeTheme});


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // Menggunakan Scaffold untuk menerapkan tema
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),

        child: AppBar(
          actions: [
            IconButton(
              onPressed: () => {
                onChangeTheme()
              },
              icon: SvgPicture.asset(
                'assets/icons/change-2.svg',
                width: 50,
                height: 50,
                colorFilter: ColorFilter.mode(
                  Colors.white60, // Warna icon
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
          title: Text(
            'Portofolio',
            style: TextStyle(
              color: Colors.white60,
              fontFamily: 'Poppins',

              fontSize: 30,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),

      // Ini akan menggunakan scaffoldBackgroundColor yang Anda tetapkan
      body: Center(
        child: ProfileCard(
          name: 'Dimas',
          faculty: 'Communication Technology and Informatics',
          major: 'Informatics',
          quote:
              'Someone who enjoys doing research and development in software engineering and is interested in developing best practices.',
          projects: 1,
          gpa: 3.8,
          years: 2,
          hobbies: [
            {
              'name': 'Coding',
              'icon': Icons.code,
              'color': colorScheme.primary,
              // Tidak perlu menentukan warna, akan menggunakan primary
            },
            {
              'name': 'Music',
              'icon': Icons.music_note,
              'color': colorScheme.secondary,
              // Tidak perlu menentukan warna, akan menggunakan secondary
            },
            {
              'name': 'Hiking',
              'icon': Icons.terrain,
              'color': colorScheme.tertiary,
              // Tidak perlu menentukan warna, akan menggunakan tertiary
            },
          ],
        ),
      ),
    );
  }
}
