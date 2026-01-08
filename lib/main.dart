import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seva_saathi/controller/auth_provider/auth_provider.dart';
import 'package:seva_saathi/controller/view/splash_screen.dart';
import 'package:seva_saathi/dashboard/home_screen.dart';

void main(){
  runApp(MyApp()
    // MultiProvider(providers: [
    //   ChangeNotifierProvider(create: (context) => AuthProvider(),)
    // ],child:
    // MyApp(),)
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home:HomeScreen()
    );
  }
}
