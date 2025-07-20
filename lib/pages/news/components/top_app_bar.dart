import 'package:flutter/material.dart';

class TopAppBarNews extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBarNews({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120),
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blue,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: "News"),
                Tab(text: "Announcements"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
