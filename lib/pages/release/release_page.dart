import 'package:blindz_app/pages/release/components/filters_products.dart';
import 'package:blindz_app/pages/release/components/release_view.dart';
import 'package:blindz_app/pages/release/components/top_app_bar.dart';
import 'package:flutter/material.dart';

class ReleasePage extends StatefulWidget {
  const ReleasePage({super.key});

  @override
  State<ReleasePage> createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage> {
  String _searchQuery = '';
  String _category = 'All';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(title: const Text('Releases')),
        appBar: TopAppBarRelease(),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                FilterBar(
                  onFilterChanged: (search, category) {
                    // Handle filter changes here
                    setState(() {
                      _searchQuery = search;
                      _category = category;
                    });
                  },
                ),
                ReleaseViewList(category: _category, searchQuery: _searchQuery),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
