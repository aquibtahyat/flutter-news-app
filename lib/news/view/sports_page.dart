import 'dart:core';

import 'package:flutter/material.dart';

import 'package:flutter_news/news/controller/news_controller.dart';
import 'package:flutter_news/news/data/model/article_response.dart';
import 'package:flutter_news/widgets/app_bar.dart';
import 'widgets/news_item_widget.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  List<NewsModel> news = List.empty(growable: true);
  NewsController newsController = NewsController();
  late String currentDate;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    currentDate = '${now.year}-${now.month}-${now.day - 1}';
    asyncMethod();
  }

  asyncMethod() async {
    await newsController.getNews(q: "sports-news", from: currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: StreamBuilder<List<NewsModel>>(
          stream: newsController.newsSteamController,
          builder: (context, snapshot) {
            List<NewsModel> newsData = [];

            if (snapshot.hasData) {
              newsData = snapshot.data!;
              news = newsData;
              return SingleChildScrollView(
                child: Column(
                  children: List<Widget>.generate(news.length,
                      (index) => NewsItemWidget(news: news[index])),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      //bottomNavigationBar: bottomNavigationBar(currentIndex),
    );
  }
}
