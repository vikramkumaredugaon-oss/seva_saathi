import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seva_saathi/controller/view/otp_verification_screen.dart';

import '../auth_provider/auth_provider.dart';

class ForgotPhoneScreen extends StatelessWidget {
  const ForgotPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final authFlag = Provider.of<AuthProvider>(context);
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
                      child: Text("Enter your registered phone to reset your password",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 50),
                      child: Text("Enter Your Phone Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Enter phone number",

                          prefixIcon: InkWell(
                            onTap: () {
                              showCountryPicker(context: context, showPhoneCode: true, onSelect: (Country country) {
                                context.read<AuthProvider>().setCountry( '+${country.phoneCode}', country.flagEmoji,);
                              },);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(authFlag.countryFlag,style: TextStyle(fontSize: 18),),
                                  Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,),
                                  SizedBox(width: 6),
                                  Text("|", style: TextStyle(fontSize: 22, color: Colors.grey,),),
                                  SizedBox(width: 6),
                                  Text(authFlag.countryCode, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey,),),
                                  SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),

                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),

                          filled: true,
                          fillColor: Colors.grey.shade300,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
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
