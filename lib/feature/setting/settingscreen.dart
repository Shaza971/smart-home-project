import 'package:flutter/material.dart';
import 'package:smart_home/cores/utils/app_colors.dart';
import 'package:smart_home/cores/widgets/drewer.dart';
import 'package:smart_home/feature/Analytics/Analytics.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.person, color: Colors.green),
          ),
        ],
      ),

      drawer: drawer(),

      backgroundColor: const Color(0xFFEEF1EA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  profileCard(),
                  const SizedBox(height: 20.0),
                  sectionCard(
                    title: 'ACCOUNT',
                    children: [
                      buildSettingTile(
                        title: 'Edit Profile',
                        subtitle: 'Rebecca Barbara',
                        icon: Icons.person,
                        onTap: () {},
                      ),
                      buildSettingTile(
                        title: 'Privacy',
                        subtitle: 'Manage your data',
                        icon: Icons.visibility,
                        onTap: () {},
                      ),
                      buildSettingTile(
                        title: 'Security',
                        subtitle: 'Password · 2FA enabled',
                        icon: Icons.shield,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  sectionCard(
                    title: 'PREFERENCES',
                    children: [
                      buildSettingTile(
                        title: 'Notifications',
                        subtitle: 'Alerts & reminders',
                        icon: Icons.notifications,
                        trailing: Switch(
                          value: true,
                          activeColor: AppColors.maincolor,
                          onChanged: (value) {},
                        ),
                      ),
                      buildSettingTile(
                        title: 'Dark Mode',
                        subtitle: 'Switch appearance',
                        icon: Icons.dark_mode,
                        trailing: Switch(
                          value: false,
                          activeColor: AppColors.maincolor,
                          onChanged: (value) {},
                        ),
                      ),
                      buildSettingTile(
                        title: 'Sound Effects',
                        subtitle: 'Device feedback tones',
                        icon: Icons.volume_up,
                        trailing: Switch(
                          value: true,
                          activeColor: AppColors.maincolor,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  sectionCard(
                    title: 'SYSTEM',
                    children: [
                      buildSettingTile(
                        title: 'Connected Devices',
                        subtitle: '12 devices paired',
                        icon: Icons.devices,
                        onTap: () {},
                      ),
                      buildSettingTile(
                        title: 'Wi-Fi & Network',
                        subtitle: 'HomeNet_5G',
                        icon: Icons.wifi,
                        onTap: () {},
                      ),
                      buildSettingTile(
                        title: 'Help & Support',
                        subtitle: 'FAQs and contact',
                        icon: Icons.help_outline,
                        onTap: () {},
                      ),
                      buildSettingTile(
                        title: 'About',
                        subtitle: 'Version 2.4.1',
                        icon: Icons.info_outline,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  signOutCard(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:  NavigationBar(context),
    );
  }

/////////////////////////////////////////////widgts functinos ////////////////
////////////////////////////////////////////////////////////////////////
BottomNavigationBar NavigationBar(BuildContext context) {
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

  Widget buildSettingTile({
    required String title,
    required String subtitle,
    required IconData icon,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF5EE),
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF2A4A38),
                size: 20,
              ),
            ),
            const SizedBox(width: 14.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) ...[
              trailing,
            ] else ...[
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 18,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget profileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: AppColors.maincolor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 38,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Rebecca Barbara",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "rebecca@smarthome.io",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white70,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget sectionCard({required String title, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 12.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          ...children,
          const SizedBox(height: 14.0),
        ],
      ),
    );
  }

  Widget signOutCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
      child: buildSettingTile(
        title: 'Sign Out',
        subtitle: 'Rebecca Barbara',
        icon: Icons.logout,
        onTap: () {},
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.redAccent,
          size: 18,
        ),
      ),
    );
  }
}