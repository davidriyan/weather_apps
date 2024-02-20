import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:weather_apps/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:weather_apps/features/gempa/presentation/pages/gempa_screen.dart';
import 'package:weather_apps/utils/colors.dart';

class PersistenceNavbar extends StatelessWidget {
  PersistenceNavbar({Key? key}) : super(key: key);

  final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      const DashboardScreen(),
      const GempaScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.blueColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: AppColors.blueColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.whiteColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.bounceIn,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 300),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
