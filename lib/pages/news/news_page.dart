import 'package:blindz_app/pages/news/components/news_view.dart';
import 'package:blindz_app/pages/news/components/top_app_bar.dart';
import 'package:blindz_app/pages/news/data/article_struct.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBarNews(tabController: _tabController),
      body: TabBarView(
        controller: _tabController,
        children: [
          NewsListView(articles: _news),
          NewsListView(articles: _announcement),
        ],
      ),
    );
  }
}

final List<Article> _news = [
  Article(
    title: "Michele bubu smette di fumare",
    author: "Jacopo Times News",
    imageUrl: "https://picsum.photos/id/1040/960/540",
    postedOn: "3 hours ago",
  ),
  Article(
    title: "Labubu Summer Carnival Series Sold Out in Minutes",
    author: "Toy Chronicle",
    imageUrl: "https://picsum.photos/id/1040/960/540",
    postedOn: "3 hours ago",
  ),
  Article(
    title: "Blind Box Craze: Why Pop Mart is Taking Over Collectibles",
    author: "Hypebeast",
    imageUrl: "https://picsum.photos/id/1041/960/540",
    postedOn: "Today",
  ),
  Article(
    title: "Rare Labubu Pulled from Secret Series in NYC Drop",
    author: "Pop Mart Times",
    imageUrl: "https://picsum.photos/id/1042/960/540",
    postedOn: "Yesterday",
  ),
  Article(
    title: "Collectors Queue Overnight for Labubu Forest Adventure Drop",
    author: "Figurine Feed",
    imageUrl: "https://picsum.photos/id/1043/960/540",
    postedOn: "5 hours ago",
  ),
];

final List<Article> _announcement = [
  Article(
    title: "Pop Mart Announces Labubu Halloween Series for October",
    author: "Pop Mart Official",
    imageUrl: "https://picsum.photos/id/1044/960/540",
    postedOn: "1 day ago",
  ),
  Article(
    title: "Blind Box Voting Now Open: Choose Your Next Series",
    author: "Blindz Team",
    imageUrl: "https://picsum.photos/id/1045/960/540",
    postedOn: "3 days ago",
  ),
  Article(
    title: "Labubu x KFC Collaboration Releasing Limited Figures",
    author: "KFC Newsroom",
    imageUrl: "https://picsum.photos/id/1046/960/540",
    postedOn: "2 days ago",
  ),
  Article(
    title: "Pre-orders Live: Labubu Zodiac Collection (2025 Edition)",
    author: "Pop Mart Official",
    imageUrl: "https://picsum.photos/id/1047/960/540",
    postedOn: "Today",
  ),
];
