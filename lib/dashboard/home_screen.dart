import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seva_saathi/notification_screen/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _offerController = PageController();
  int currentIndex = 0;

  final List<Color> offerColors = [
    Colors.redAccent,
    Colors.deepPurple,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();

    /// AUTO SLIDE
    Timer.periodic(const Duration(seconds: 3), (timer) {
      currentIndex++;
      if (currentIndex == offerColors.length) {
        currentIndex = 0;
      }

      _offerController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNav(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning 👋",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Andreew Ainsley",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  /// 🔔 Notification
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(),));
                      print("Notification clicked");
                    },
                  ),

                  /// 🔖 Save / Bookmark (PEHLE WALA)
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {
                      print("Save clicked");
                    },
                  ),
                ],
              ),


              const SizedBox(height: 20),

              /// SEARCH
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.grey,),
                    hintText: "Search",hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[300]
                ),),

              const SizedBox(height: 24),

              /// SPECIAL OFFER (AUTO SLIDER)
              sectionTitle("Special Offers"),
              const SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: _offerController,
                  itemCount: offerColors.length,
                  itemBuilder: (_, i) => specialOfferCard(w, offerColors[i]),
                  padEnds: true,
                ),
              ),

              const SizedBox(height: 24),

              /// CATEGORIES (PEHLE JAISA HI)
              sectionTitle("All Categories"),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (_, i) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(categoryList[i]["icon"]!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        categoryList[i]["name"]!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 11),
                      ),
                    ],
                  );
                },
              ),


              const SizedBox(height: 24),

              /// BEST SERVICES
              sectionTitle("Best Services"),
              const SizedBox(height: 12),
              SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (_, i) => serviceCard(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (_, i) => serviceCard(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

//// ---------------- WIDGETS ----------------

Widget specialOfferCard(double w, Color color) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Stack(
        children: [
          Container(
            height: 180,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("30%",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text("Today's Special!",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                const SizedBox(height: 6),
                Text("Get discount for every order",
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: Colors.white70)),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 0,
            child: Image.asset(
              "assets/home_screen_image/image.png",
              height: w * 0.40,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget serviceCard() {
  return InkWell(
    onTap: () {
      print("Service clicked");
    },
    child: Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE
          ClipRRect(
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              "assets/home_screen_image/painting image.jpg",
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// DETAILS
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// RATING
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text("4.9 (120 Review)",
                        style: TextStyle(fontSize: 12)),
                  ],
                ),

                const SizedBox(height: 6),

                /// TITLE
                Text(
                  "Car repair",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                /// PRICE
                Row(
                  children: [
                    Text(
                      "\$120",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "\$180",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// PROVIDER + ADD
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundImage:
                      AssetImage("assets/user.png"),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        "Malik Willions",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                        GoogleFonts.poppins(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Add clicked");
                        },
                        style: ElevatedButton.styleFrom(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 14),backgroundColor: Colors.lightBlueAccent.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text("Add"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}



Widget sectionTitle(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w600)),
      Text("See All",
          style: GoogleFonts.poppins(color: Colors.deepPurple)),
    ],
  );
}

Widget bottomNav(BuildContext context) {
  return  BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepPurple,
    unselectedItemColor: Colors.grey,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.list), label: "Booking"),
      BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today), label: "Calendar"),
      BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Inbox"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
  );
}

final categoryList = [
  {"name": "Carpenter", "icon": "assets/home_screen_image/carpenter.png"},
  {"name": "Painter", "icon": "assets/home_screen_image/painter.png"},
  {"name": "Electrician", "icon": "assets/home_screen_image/electricity.png"},
  {"name": "AC Repair", "icon": "assets/home_screen_image/ac.png"},
  {"name": "Plumber", "icon": "assets/home_screen_image/plumber.png"},
  {"name": "Vehicle", "icon": "assets/home_screen_image/car.png"},
  {"name": "Appliance", "icon": "assets/home_screen_image/appiliance.png"},
  {"name": "Repairing", "icon": "assets/home_screen_image/repairing.png"},
];
