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
      body: screenList[_bottomNavIndex],
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
