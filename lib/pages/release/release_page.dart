import 'package:blindz_app/pages/release/components/filters_products.dart';
import 'package:blindz_app/pages/release/components/product_box.dart';
import 'package:blindz_app/pages/release/data/prodcut_struct.dart';
import 'package:flutter/material.dart';

class ReleasePage extends StatefulWidget {
  ReleasePage({super.key});

  @override
  State<ReleasePage> createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage> {
  String _searchQuery = '';
  String _category = 'All';

  List<Product> get _filteredProducts {
    return _sampleProducts.where((product) {
      final matchesSearch =
          product.productName.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          product.title.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesCategory =
          _category == 'All' ||
          //THIS IS THE FILTER PARAMETER
          product.category.toLowerCase().contains(_category.toLowerCase());

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  print('Search: $search, Category: $category');
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _filteredProducts[index];
                    return ReleaseBox(product: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Product> _sampleProducts = [
  Product(
    title: "Limited Sneaker Drop",
    imageUrl: "assets/images/Lababa.webp",
    productName: "Jacopo bubu ",
    productPrice: "\$199",
    productLike: 100,
    productDislike: 100,
    productDropTime: "2025-07-21 10:00",
    category: "Toys",
  ),
  Product(
    title: "Streetwear Capsule",
    imageUrl: "assets/images/Lababa.webp",
    productName: "Giovane anicione",
    productPrice: "\$89",
    productLike: 100,
    productDislike: 200,
    productDropTime: "2025-07-22 18:00",
    category: "Figures",
  ),
  Product(
    title: "Accessory Highlight",
    imageUrl: "assets/images/Lababa.webp",
    productName: "Michele il tossico bubu",
    productPrice: "\$349",
    productLike: 100,
    productDislike: 200,
    productDropTime: "2025-07-25 09:30",
    category: "Figures",
  ),
  Product(
    title: "Tech Wear Essential",
    imageUrl: "assets/images/Lababa.webp",
    productName: "ThermoFlex Jacket",
    productPrice: "\$229",
    productLike: 100,
    productDislike: 200,
    productDropTime: "2025-07-23 12:00",
    category: "Figures",
  ),
  Product(
    title: "Collector’s Edition",
    imageUrl: "assets/images/Lababa.webp",
    productName: "Retro Arcade Pack",
    productPrice: "\$129",
    productLike: 100,
    productDislike: 200,
    productDropTime: "2025-07-30 16:00",
    category: "Figures",
  ),
];
