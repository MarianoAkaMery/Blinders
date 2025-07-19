import 'package:blindz_app/pages/release/data/prodcut_struct.dart';
import 'package:flutter/material.dart';

class ReleaseBox extends StatelessWidget {
  const ReleaseBox({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    //container that expands to   fit all the content

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              product.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Center(child: Icon(Icons.broken_image, size: 40)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product.productName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "${product.productPrice} ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "${product.productDropTime} ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      [
                        Icons.thumb_up_rounded,
                        Icons.share,
                        Icons.thumb_down_alt_sharp,
                      ].map((e) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(e, size: 16),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            height: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Row(
                children: [
                  Expanded(
                    flex: product.productLike,
                    child: Container(color: Colors.green),
                  ),
                  Expanded(
                    flex: product.productDislike,
                    child: Container(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
