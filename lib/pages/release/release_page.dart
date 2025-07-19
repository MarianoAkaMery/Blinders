import 'package:blindz_app/pages/release/components/product_box.dart';
import 'package:blindz_app/pages/release/data/prodcut_struct.dart';
import 'package:flutter/material.dart';

class ReleasePage extends StatefulWidget {
  const ReleasePage({super.key});

  @override
  State<ReleasePage> createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: _sampleProducts.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _sampleProducts[index];
              return ReleaseBox(product: item);
            },
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
  ),
  Product(
    title: "Streetwear Capsule",
    imageUrl: "assets/images/Lababa.webp",
    productName: "Giovane anicione",
    productPrice: "\$89",
    productLike: 100,
    productDislike: 200,
    productDropTime: "2025-07-22 18:00",
  ),
  Product(
    title: "Accessory Highlight",
    imageUrl: "assets/images/Lababa.webp",
    productName: "Michele il tossico bubu",
    productPrice: "\$349",
    productLike: 100,
    productDislike: 200,
    productDropTime: "2025-07-25 09:30",
  ),
  Product(
    title: "Tech Wear Essential",
    imageUrl: "assets/images/Lababa.webp",
    productName: "ThermoFlex Jacket",
    productPrice: "\$229",
    productLike: 100,
    productDislike: 200,
    productDropTime: "2025-07-23 12:00",
  ),
  Product(
    title: "Collector’s Edition",
    imageUrl: "assets/images/Lababa.webp",
    productName: "Retro Arcade Pack",
    productPrice: "\$129",
    productLike: 100,
    productDislike: 200,
    productDropTime: "2025-07-30 16:00",
  ),
];
