
import 'package:flutter/material.dart';
import 'package:smart_home/cores/utils/app_assets.dart';
import 'package:smart_home/cores/utils/app_colors.dart';
import 'package:smart_home/cores/widgets/drewer.dart';
import 'package:smart_home/feature/Analytics/Analytics.dart';
import 'package:smart_home/feature/setting/settingscreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        title: Text('My Home'),
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Wednesday, June 20',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Good evening, Rebecca',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    const Text('You have 3 rooms active and 12 devices running right now.'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: infoCard(
                            icon: Icons.thermostat,
                            value: '22°C',
                            title: 'Inside',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: infoCard(
                            icon: Icons.wb_sunny_outlined,
                            value: '18°C',
                            title: 'Outside',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: infoCard(
                            icon: Icons.water_drop_outlined,
                            value: '58%',
                            title: 'Humidity',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Rooms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              roomCard(
                image: AppAssets.livingRomeIamge,
                roomName: 'Living Room',
                details: '4 devices • 22°C',
              ),
              const SizedBox(height: 20),
              roomCard(
                image: AppAssets.bedRomeIamge,
                roomName: 'Bedroom',
                details: '3 devices • 20°C',
              ),
              const SizedBox(height: 20),
              roomCard(
                image: AppAssets.kitchenRomeIamge,
                roomName: 'Kitchen',
                details: '5 devices • 24°C',
              ),
              const SizedBox(height: 20),
              const Text(
                'Devices',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.92,
                children: [
                  deviceCard(
                    icon: Icons.lightbulb_outline,
                    title: 'Main Light',
                    subTitle: 'On • 72%',
                    cardColor: AppColors.maincolor,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    switchValue: true,
                  ),
                  deviceCard(
                    icon: Icons.thermostat,
                    title: 'Thermostat',
                    subTitle: '22°C • Auto',
                    cardColor: AppColors.maincolor,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    switchValue: true,
                  ),
                  deviceCard(
                    icon: Icons.air,
                    title: 'AC Unit',
                    subTitle: 'Off',
                    cardColor: Colors.white,
                    iconColor: Colors.black,
                    textColor: Colors.black,
                    switchValue: false,
                  ),
                  deviceCard(
                    icon: Icons.lock_outline,
                    title: 'Front Door',
                    subTitle: 'Locked',
                    cardColor: AppColors.maincolor,
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    switchValue: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.maincolor,
        child: const Icon(Icons.add, color: Colors.white),
      ),

     bottomNavigationBar:  NavigationBar(context),
    );
  }

  // ignore: non_constant_identifier_names
  
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
}

////////////////////////widget///////////////////////

Widget infoCard({
  required IconData icon,
  required String value,
  required String title,
}) {
  return Container(
    height: 110,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
          icon,
          color: Colors.orange,
          size: 22,
        ),

        const SizedBox(height: 10),

        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    ),
  );
}

Widget roomCard({
    required String image,
    required String roomName,
    required String details,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  roomName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  details,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18,
          ),
        ],
      ),
    );
  }

Widget deviceCard({
  required IconData icon,
  required String title,
  required String subTitle,
  required Color cardColor,
  required Color iconColor,
  required Color textColor,
  required bool switchValue,
}) {
  return Container(
    padding:  EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 14,
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subTitle,
              style: TextStyle(
                color: textColor.withOpacity(.7),
                fontSize: 13,
              ),
            ),
          ],
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Switch(
            value: switchValue,
            onChanged: (value) {},
          ),
        ),
      ],
    ),
  );
}

