import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/mvc/controllers/movie_controller.dart';
import 'package:movie_app/src/mvc/views/fragments/dashboard.dart';
import 'package:movie_app/src/mvc/views/fragments/media_library.dart';
import 'package:movie_app/src/mvc/views/fragments/more.dart';
import 'package:movie_app/src/mvc/views/fragments/movie_list_screen.dart';
import 'package:movie_app/src/style/style.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MovieController _movieController = Get.put(MovieController());

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: PersistentTabView(
          context,
          controller: _movieController.persistentTabController,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor:
              AppStyles.bottomNavBarColor, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(AppStyles.bottomNavBarRadius),
            colorBehindNavBar: AppStyles.bottomNavBarColor,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),

          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard),
        title: ("Dashboard"),
        activeColorPrimary: AppStyles.activeItemColorPrimary,
        inactiveColorPrimary: AppStyles.inactiveItemColorPrimary,
        iconSize: AppStyles.iconSize,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.play_arrow),
        title: ("Movies"),
        activeColorPrimary: AppStyles.activeItemColorPrimary,
        inactiveColorPrimary: AppStyles.inactiveItemColorPrimary,
        iconSize: AppStyles.iconSize,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.perm_media),
        title: ("Media Library"),
        activeColorPrimary: AppStyles.activeItemColorPrimary,
        inactiveColorPrimary: AppStyles.inactiveItemColorPrimary,
        iconSize: AppStyles.iconSize,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu),
        title: ("More"),
        activeColorPrimary: AppStyles.activeItemColorPrimary,
        inactiveColorPrimary: AppStyles.inactiveItemColorPrimary,
        iconSize: AppStyles.iconSize,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const Dashboard(),
      const MovieListScreen(),
      const MediaLibrary(),
      const More()
    ];
  }
}
