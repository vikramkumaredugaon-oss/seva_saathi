import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Notification",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionTitleWidget("Today"),
            notificationTileWidget(
              context: context,
              icon: Icons.account_balance_wallet_outlined,
              color: Colors.deepPurple,
              title: "Payment Successfully",
              subtitle: "you have a services payment",
            ),
            notificationTileWidget(
              context: context,
              icon: Icons.grid_view,
              color: Colors.redAccent,
              title: "New Category Servies",
              subtitle: "you have a services payment",
            ),

            sectionTitleWidget("Yesterday"),
            notificationTileWidget(
              context: context,
              icon: Icons.local_offer_outlined,
              color: Colors.amber,
              title: "Today’s Special offers",
              subtitle: "you have a services payment",
            ),

            sectionTitleWidget("December 22, 2026"),
            notificationTileWidget(
              context: context,
              icon: Icons.credit_card,
              color: Colors.deepPurple,
              title: "Credit Card Connecter!",
              subtitle: "you have a services payment",
            ),
            notificationTileWidget(
              context: context,
              icon: Icons.person_outline,
              color: Colors.green,
              title: "Account Setup Successful!",
              subtitle: "your account has been created!",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

/// ---------------- WIDGETS ----------------

Widget sectionTitleWidget(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  );
}

Widget notificationTileWidget({
  required BuildContext context,
  required IconData icon,
  required Color color,
  required String title,
  required String subtitle,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(14),
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(title),
          duration: const Duration(seconds: 1),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [

          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 22),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
