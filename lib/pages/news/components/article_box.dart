import 'package:blindz_app/pages/news/data/article_struct.dart';
import 'package:flutter/material.dart';

class ArticleBox extends StatelessWidget {
  const ArticleBox({super.key, required this.articleItem});
  final Article articleItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      height: 136,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          /// ✅ Expand the text to fill the space
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articleItem.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  "${articleItem.author} · ${articleItem.postedOn}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      [
                        Icons.bookmark_border_rounded,
                        Icons.share,
                        Icons.more_vert,
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
          const SizedBox(width: 8),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(articleItem.imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
