import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:seva_saathi/controller/view/onboarding_main_screen.dart';

import 'onboarding_splash_screen1.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingMainScreen(),)),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.85,
            colors: [
              Color(0xFF3F5BFF),
              Color(0xFF1E3AA8),
              Color(0xFF0A1E6A),
            ],
            stops: [0.0, 0.45, 1.0],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 190,),
            CircleAvatar(radius: 65,backgroundColor: Colors.white,
              child: Image.asset("assets/images/splash_logo.png"),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Seva",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                Text("Sathi",style: TextStyle(color: Colors.orange,fontSize: 40,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Text("Every Service, Everywhere \n India's Own Service App",style: TextStyle(color: Colors.white,fontSize: 18),),
            SizedBox(height: 150,),
            Lottie.asset(
              "assets/images/Loader_animation.json",height: 150,width: 150,fit: BoxFit.contain,
              delegates: LottieDelegates(
              values: [
                ValueDelegate.color(
                  const ['**'],
                  value: Colors.white,
                ),
              ],
            ),),
            Text("Loading Services...",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );

  }
}
