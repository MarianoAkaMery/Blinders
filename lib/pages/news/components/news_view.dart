import 'package:blindz_app/pages/news/components/article_box.dart';
import 'package:blindz_app/pages/news/data/article_struct.dart';
import 'package:flutter/material.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          final item = articles[index];
          return ArticleBox(articleItem: item);
        },
      ),
    );
  }
}
