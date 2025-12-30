import 'package:flutter/material.dart';
import 'package:seva_saathi/controller/view/create_account_screen.dart';
import 'package:seva_saathi/controller/view/login_screen.dart';
class AuthChoiceScreen extends StatefulWidget {
  const AuthChoiceScreen({super.key});

  @override
  State<AuthChoiceScreen> createState() => _AuthChoiceScreenState();
}

class _AuthChoiceScreenState extends State<AuthChoiceScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70,),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 40,),
            Center(child: Image.asset("assets/images/auth_choice_logo.png",height: 320,width: 320,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Text("Welcome to Seva",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                Text("Sathi",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.orange),),
              ]
            ),
            SizedBox(height: 15),
            Center(child: Text("Join SevaSathi to simplify your daily tasks. Find reliable local \n service providers nearby. Book services anytime, hassle-free.",style: TextStyle(fontSize: 13, color: Colors.white),textAlign: TextAlign.center,)),
            SizedBox(height: 100,),
            Center(child: ClipRRect(borderRadius: BorderRadius.circular(8), child: MaterialButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen(),));},color: Colors.white,height: 50,minWidth: 332,child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),))),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("You already have a account?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));}, child: Text("Login",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}