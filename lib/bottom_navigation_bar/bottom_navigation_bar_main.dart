import 'package:flutter/material.dart';
import 'package:seva_saathi/bottom_navigation_bar/booking_screen.dart';
import 'package:seva_saathi/bottom_navigation_bar/calendar_screen.dart';
import 'package:seva_saathi/bottom_navigation_bar/inbox_screen.dart';
import 'package:seva_saathi/bottom_navigation_bar/profile_screen.dart';
import '../dashboard/home_screen.dart';

class BottomNavigationBarMain extends StatefulWidget {
  const BottomNavigationBarMain({super.key});

  @override
  State<BottomNavigationBarMain> createState() =>
      _BottomNavigationBarMainState();
}

class _BottomNavigationBarMainState extends State<BottomNavigationBarMain> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = const [
    HomeScreen(),
    BookingScreen(),
    CalendarScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: _screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: List.generate(5, (index) {
          return BottomNavigationBarItem(
            label: _labels[index],
            icon: Stack(
              alignment: Alignment.center,
              children: [
                if (_currentIndex == index)
                  Container(
                    height: 32,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                Icon(_icons[index]),
              ],
            ),
          );
        }),
      ),
    );
  }
}

const List<String> _labels = [
  "Home",
  "Booking",
  "Calendar",
  "Inbox",
  "Profile",
];

const List<IconData> _icons = [
  Icons.home,
  Icons.list,
  Icons.calendar_month,
  Icons.message,
  Icons.account_circle,
];
