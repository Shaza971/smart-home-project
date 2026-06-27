import 'package:flutter/material.dart';
import 'package:smart_home/cores/utils/app_colors.dart';
import 'package:smart_home/feature/Analytics/Analytics.dart';
import 'package:smart_home/feature/setting/settingscreen.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    selectedItemColor: AppColors.maincolor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
    currentIndex: 0,

    onTap: (index) {
      if (index == 0) {
        return;
      }

      if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Analytics(),
          ),
        );
      }

      if (index == 2) {
        // الصفحة الثالثة (Calendar) لسه مش موجودة
      }

      if (index == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingScreen(),
          ),
        );
      }
    },

    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bar_chart),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "",
      ),
    ],
  );
  }
}