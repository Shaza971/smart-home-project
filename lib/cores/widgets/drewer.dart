import 'package:flutter/material.dart';
import 'package:smart_home/feature/Analytics/Analytics.dart';
import 'package:smart_home/feature/home/home.dart';
import 'package:smart_home/feature/setting/settingscreen.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff2D4A3E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff2D4A3E),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xff5A897B),
                  child: Text(
                    "RB",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rebecca",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Barbara",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          ListTile(
            title: Text('profile'),
            onTap: () {},
          ),
          ListTile(
            title: Text('notifications'),
            onTap: () {},
          ),
          ListTile(
            title: Text('states'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Analytics()),
              );
            },
          ),
          ListTile(
            title: Text('schedual'),
            onTap: () {},
          ),
          ListTile(
            title: Text('settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}