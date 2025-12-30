import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
                      child: Text("New Password?",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Secure your account with a new password.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Text("Enter New Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "New Password",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.grey.shade300
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Text("Confirm Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.grey.shade300
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
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
                        child: Center(child: Text("Submit", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),)),
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
