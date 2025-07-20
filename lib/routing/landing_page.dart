import 'package:blindz_app/pages/news/news_page.dart';
import 'package:blindz_app/pages/profile/profile_page.dart';
import 'package:blindz_app/pages/release/release_page.dart';
import 'package:blindz_app/pages/restocks/restock_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RoutingPages extends StatefulWidget {
  const RoutingPages({super.key});

  @override
  State<RoutingPages> createState() => _RoutingPagesState();
}

class _RoutingPagesState extends State<RoutingPages> {
  int _bottomNavIndex = 0;

  final iconList = <IconData>[
    Icons.newspaper,
    Icons.fiber_new_sharp,
    Icons.bolt,
    Icons.person,
  ];

  final screenList = [NewsPage(), ReleasePage(), RestockPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        // Add a Key so Flutter knows the widget changed
        child: KeyedSubtree(
          key: ValueKey<int>(_bottomNavIndex),
          child: screenList[_bottomNavIndex],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // action
        },
        child: const Icon(Icons.ads_click_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
