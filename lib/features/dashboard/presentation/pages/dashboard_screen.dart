import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_apps/features/dashboard/presentation/pages/weather_screen.dart';
import 'package:weather_apps/utils/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: [
            const WeatherScreen(),
            Container(
              color: Colors.red,
            ),
            // Container(
            //   color: Colors.green,
            // ),
            // Container(
            //   color: Colors.blue,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: AppColors.blueColor,
        showElevation: false,
        items: [
          BottomNavyBarItem(
            activeColor: AppColors.blueSecondColor,
            icon: const Icon(
              Icons.home,
              color: AppColors.whiteColor,
            ),
            title: const Text(
              'Weather',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
          BottomNavyBarItem(
            activeColor: AppColors.blueSecondColor,
            icon: const Icon(Icons.account_balance_sharp,
                color: AppColors.whiteColor),
            title: const Text(
              'Quake',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          )
        ],
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() => currentIndex = index);
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
