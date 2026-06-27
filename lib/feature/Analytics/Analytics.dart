import 'package:flutter/material.dart';
import 'package:smart_home/cores/utils/app_colors.dart';
import 'package:smart_home/cores/widgets/drewer.dart';
import 'package:smart_home/feature/home/home.dart';
import 'package:smart_home/feature/setting/settingscreen.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: const Text(
          'Analytics',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(Icons.person, color: AppColors.maincolor),
          ),
        ],
      ),

        drawer: drawer(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This week',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Energy Usage',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            _buildUsageCard(),
            const SizedBox(height: 24),
            const Text(
              'Daily Breakdown',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildDailyRow('Mon', 0.65, '5.2 kWh'),
            const SizedBox(height: 14),
            _buildDailyRow('Tue', 0.78, '6.8 kWh'),
            const SizedBox(height: 14),
            _buildDailyRow('Wed', 1.0, '7.3 kWh', highlight: true),
            const SizedBox(height: 14),
            _buildDailyRow('Thu', 0.6, '4.9 kWh'),
            const SizedBox(height: 14),
            _buildDailyRow('Fri', 0.84, '6.3 kWh'),
            const SizedBox(height: 30),
            const Text(
              'Top Consumers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildConsumerCard(
              icon: Icons.ac_unit,
              title: 'AC Unit',
              subtitle: 'Bedroom',
              value: '12.4 kWh',
              fill: 0.92,
            ),
            const SizedBox(height: 12),
            _buildConsumerCard(
              icon: Icons.power,
              title: 'Refrigerator',
              subtitle: 'Kitchen',
              value: '9.8 kWh',
              fill: 0.73,
            ),
            const SizedBox(height: 12),
            _buildConsumerCard(
              icon: Icons.lightbulb,
              title: 'Lighting',
              subtitle: 'All rooms',
              value: '7.2 kWh',
              fill: 0.57,
            ),
            const SizedBox(height: 12),
            _buildConsumerCard(
              icon: Icons.thermostat,
              title: 'Thermostat',
              subtitle: 'Living Room',
              value: '5.1 kWh',
              fill: 0.41,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

//////////////////widgets///////////////////

  Widget _buildConsumerCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
    required double fill,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.maincolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: AppColors.maincolor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: fill,
              minHeight: 8,
              color: AppColors.maincolor,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.maincolor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total this month',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '48.2 kWh',
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              '+ 12% vs last month',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _chartBar(height: 35, selected: false),
              _chartBar(height: 48, selected: false),
              _chartBar(height: 30, selected: false),
              _chartBar(height: 54, selected: true),
              _chartBar(height: 40, selected: false),
              _chartBar(height: 44, selected: false),
              _chartBar(height: 28, selected: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chartBar({required double height, bool selected = false}) {
    return Container(
      width: 16,
      height: height,
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildDailyRow(String day, double fill, String value, {bool highlight = false}) {
    return Row(
      children: [
        SizedBox(
          width: 48,
          child: Text(
            day,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: highlight ? AppColors.maincolor : Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: fill,
                child: Container(
                  height: 18,
                  decoration: BoxDecoration(
                    color: highlight ? AppColors.maincolor : AppColors.maincolor.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 58,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 15,
              color: highlight ? AppColors.maincolor : Colors.black54,
              fontWeight: highlight ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.maincolor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      currentIndex: 1,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        }
        if (index == 1) {
          return;
        }
        if (index == 2) {
          // Calendar page not implemented yet
        }
        if (index == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SettingScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
        ),
      ],
    );
  }
}
