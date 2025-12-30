import 'package:flutter/material.dart';
import 'package:seva_saathi/controller/view/otp_verification_screen.dart';

class ForgotEmailScreen extends StatelessWidget {
  const ForgotEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:[
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
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.28),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Fogot Password",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Enter your registered email to reset your password",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 50),
                    child: Text("Enter Your Email Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email,color: Colors.grey,),
                        border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.grey[300]
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen(),));
                      },
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
                    ),
                  )

                ],
              ),
            ),
          )
        ]
      ),

    );
  }
}
