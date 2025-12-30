import 'package:flutter/material.dart';
import 'package:seva_saathi/controller/view/auth_choice_screen.dart';

class AuthProvider extends ChangeNotifier {
  /* ================= Onboarding ================= */

  final PageController controller = PageController();
  int currentIndex = 0;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void next(BuildContext context) {
    final page = controller.page?.round() ?? 0;
    if (page < 2) {
      controller.animateToPage(
        page + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AuthChoiceScreen()),
      );
    }
  }

  /* ================= Auth Choice ================= */

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void selectOption(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /* ================= Country ================= */

  String _countryCode = '+91';
  String _countryFlag = '🇮🇳';

  String get countryCode => _countryCode;
  String get countryFlag => _countryFlag;

  void setCountry(String code, String flag) {
    _countryCode = code;
    _countryFlag = flag;
    notifyListeners();
  }

  /* ================= OTP Choice ================= */

  int selectedOtpIndex = -1; // 0 = SMS, 1 = Email

  void selectOtpOption(int index) {
    selectedOtpIndex = index;
    notifyListeners();
  }

  bool get isSms => selectedOtpIndex == 0;
  bool get isEmail => selectedOtpIndex == 1;

  /* ================= User Data ================= */

  String phoneNumber = "7461055870";
  String email = "vikram@gmail.com";

  /* ================= OTP Text ================= */

  String get otpSubtitle {
    return isSms
        ? "Phone Number"
        : "Email Address";
  }

  String get maskedValue {
    if (isSms) {
      return "$_countryCode ${_maskPhone(phoneNumber)}";
    } else {
      return _maskEmail(email);
    }
  }

  /* ================= Helpers ================= */

  String _maskPhone(String phone) {
    if (phone.length < 6) return phone;
    return phone.replaceRange(2, phone.length - 2, "******");
  }

  String _maskEmail(String email) {
    final parts = email.split("@");
    if (parts.length != 2) return email;

    final name = parts[0];
    final domain = parts[1];

    final maskedName =
    name.length <= 3 ? "***" : "${name.substring(0, 3)}***";

    return "$maskedName@$domain";
  }
}
