import 'package:flutter/material.dart';
import 'package:seva_saathi/controller/view/create_account_screen.dart';
import 'package:seva_saathi/controller/view/forgot_otp_choice_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: height * 0.30,
                child: Stack(
                  children: [

                    Positioned(
                      top: -10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          "assets/images/Ellipse 3.png",
                          height: height * 0.20,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset(
                        "assets/images/Ellipse 1.png",
                        height: height * 0.20,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/Ellipse 2.png",
                        height: height * 0.30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 250,),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Login", style: TextStyle(color: Colors.black,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text("Login to continue accessing trusted Seva",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),),
                        Text("Sathi", style: TextStyle(color: Colors.orange,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email, color: Colors.grey,),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.grey[300]
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password, color: Colors.grey,),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.grey[300]
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen(),));}, child: Text("Create Account?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotOtpChoiceScreen(),));}, child: Text("Forgot Password?", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)),
                      ),
                    ],
                  ),
                  SizedBox(height: 45,),
                  Center(
                    child: Container(height: 50, width: 320,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF354EBD),
                            Color(0xFF6A5AE0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(child: Text("Next", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),)),
                    ),
                  )
                ],
              ),
            )
          ]
      ),
    );
  }
}
