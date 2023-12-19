
// ignore_for_file: unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_background/animated_background.dart';

import 'package:matemafront/utils/app_colors.dart';
import 'package:matemafront/utils/app_dimensions.dart';
import 'package:matemafront/utils/app_fonts.dart';

import 'package:matemafront/pages/register_page_logic.dart';
import 'package:matemafront/pages/login_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeSreenState();
}

class _WelcomeSreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verylightBackground,
      body: Stack(
        children: [
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                baseColor: AppColors.appGreen,
                particleCount: 7,
                spawnMinSpeed: 5.0,
                spawnMaxRadius: 110,
                spawnMinRadius: 55,
                spawnMaxSpeed: 20.0,
                maxOpacity: 1.0,
                spawnOpacity: 0.0,
                opacityChangeRate: 10.0,
              ),
            ),
            vsync: this,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
                child: _buildContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MaTema',
                style: GoogleFonts.loveYaLikeASister(
                  color: AppColors.appPurple,
                  fontSize: 70,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Від MaTema Group',
                style: AppFonts.semibold15(color: AppColors.appPurple),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.appPurple),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(100, 70)),
                ),
                child: const Text(
                  'Зареєструватись',
                  style: AppFonts.boldWhite26,
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.appPurple),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(100, 70)),
                ),
                child: const Text(
                  'Увійти',
                  style: AppFonts.boldWhite26,
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Про MaTema Group',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.appPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
