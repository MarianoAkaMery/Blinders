import 'package:blindz_app/pages/release/data/prodcut_struct.dart';
import 'package:flutter/material.dart';
import 'package:blindz_app/pages/release/components/product_box.dart';
import 'package:intl/intl.dart';

class ReleaseViewList extends StatelessWidget {
  const ReleaseViewList({
    super.key,
    required this.searchQuery,
    required this.category,
  });
  final String searchQuery;
  final String category;

  List<Product> get _filteredProducts {
    return _sampleProducts.where((product) {
      final matchesSearch =
          product.productName.toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          product.title.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesCategory =
          category == 'All' ||
          //THIS IS THE FILTER PARAMETER
          product.category.toLowerCase().contains(category.toLowerCase());

      return matchesSearch && matchesCategory;
    }).toList();
  }

  String formatDropDate(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return DateFormat('d MMMM').format(dateTime); // e.g. 21 July
  }

  @override
  Widget build(BuildContext context) {
    String dropTimePlaceHolder = 'Time';
    return Expanded(
      child: ListView.builder(
        itemCount: _filteredProducts.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _filteredProducts[index];
          if (item.productDropTime != dropTimePlaceHolder) {
            dropTimePlaceHolder = item.productDropTime;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        formatDropDate(item.productDropTime),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ReleaseBox(product: item),
              ],
            ); // Skip past releases
          }
          return ReleaseBox(product: item);
        },
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
    productDropTime: "2025-07-22 18:00",
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
