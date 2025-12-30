import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seva_saathi/controller/auth_provider/auth_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_splash_screen1.dart';
import 'onboarding_splash_screen2.dart';
import 'onboarding_splash_screen3.dart';

class OnboardingMainScreen extends StatelessWidget {
  const OnboardingMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: provider.controller,
            onPageChanged: provider.onPageChanged,
            children: const [
              OnboardingSplashScreen1(),
              OnboardingSplashScreen2(),
              OnboardingSplashScreen3(),
            ],
          ),

          // Dots Indicator
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: provider.controller,
                count: 3,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
