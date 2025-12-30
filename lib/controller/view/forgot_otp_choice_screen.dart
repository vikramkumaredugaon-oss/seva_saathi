import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seva_saathi/controller/auth_provider/auth_provider.dart';
import 'package:seva_saathi/controller/view/forgot_email_screen.dart';

import 'forgot_phone_screen.dart';

class ForgotOtpChoiceScreen extends StatelessWidget {
  const ForgotOtpChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(child: Image.asset("assets/images/otp_choice1.png", height: 350, width: 350,),),
          Spacer(),
          Container(height: 380, width: double.infinity, decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15),), color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, -6),),],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 30),
                  child: Text("Select which contact details should we use \n to reset your password", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                  ),
                ),

                _otpCard(context: context,
                  index: 0, icon: Icons.sms,
                  title: "OTP via SMS",
                  value: "+91 74******70",
                  isSelected: provider.selectedOtpIndex == 0,
                ),

                _otpCard(context: context,
                  index: 1,
                  icon: Icons.email,
                  title: "OTP via Email",
                  value: "vik***@gmail.com",
                  isSelected: provider.selectedOtpIndex == 1,
                ),
                SizedBox(height: 35,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      final auth = context.read<AuthProvider>();

                      if (auth.selectedOtpIndex == -1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select OTP option')),
                        );
                        return;
                      }

                      if (auth.isSms) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPhoneScreen(),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotEmailScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 320,
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
                      child: const Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpCard({
    required BuildContext context,
    required int index,
    required IconData icon,
    required String title,
    required String value,
    required bool isSelected,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          context.read<AuthProvider>().selectOtpOption(index);
        },
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
              color: isSelected ? Colors.blue : Colors.grey,
              width: isSelected ? 2 : 1,
            ),
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(radius: 25,
                  backgroundColor: Colors.blue.shade50,
                  child: Icon(icon, color: Colors.blue),
                ),
                SizedBox(width: 15),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey,),),
                    SizedBox(height: 2),
                    Text(value, style: TextStyle(fontSize: 18, color: Colors.black,),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
