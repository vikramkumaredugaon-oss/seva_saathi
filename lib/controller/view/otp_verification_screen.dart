import 'package:flutter/material.dart';
import 'package:seva_saathi/controller/view/new_password_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
                      child: Text("OTP Verification?",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Enter the OTP sent to - +91 7461055870 ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return Row(
                            children:[
                              SizedBox(
                                width: 45,height: 45,

                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[300],
                                  ),
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  onChanged: (value) {
                                    if (value.isNotEmpty && index < 5) {
                                      FocusScope.of(context).nextFocus();
                                    } else if (value.isEmpty && index > 0) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  },
                                ),
                              ),
                            ]
                          );
                        }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("0:60 Second"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,right: 30),
                          child: Text("Don’t receive code ? Re-send"),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewPasswordScreen(),));
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
                          child: Center(child: Text("Submit", style: TextStyle(
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
