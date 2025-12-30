import 'dart:ui';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seva_saathi/controller/auth_provider/auth_provider.dart';
import 'package:seva_saathi/controller/view/create_account_otp_choice_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final authFlag = Provider.of<AuthProvider>(context);
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 125),
                    Text("Create \n Account", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,height: 1.2),),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: SizedBox(height: 100,width: 100, child: Card(elevation: 10, color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),child: Icon(Icons.camera_alt_outlined,color: Colors.blue,size: 40,),)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Username",
                          prefixIcon: Icon(Icons.person,color: Colors.grey,),
                          border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email,color: Colors.grey,),
                          border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password,color: Colors.grey,),
                          border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
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
                                  Text(authFlag.countryFlag),
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateOtpChoiceScreen(),));
                      },
                      child: Container(height: 50, width: double.infinity,
                        decoration: BoxDecoration(color: Color(0xFF2F49C6), borderRadius: BorderRadius.circular(10),),
                        alignment: Alignment.center,
                        child: Text("Done", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Divider(endIndent: 10,indent: 10,)),
                        Text("Or"),
                        Expanded(child: Divider(endIndent: 10,indent: 10,)),
                      ],
                    ),
                    SizedBox(height: 20,),
                    MaterialButton(onPressed: (){},height: 50,minWidth: 320,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(10)),child: Row(
                      children: [
                        Image.asset("assets/images/img_1.png",height: 20,width: 20,),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("Sign Up with Google"),
                        ),
                      ],
                    ),),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}