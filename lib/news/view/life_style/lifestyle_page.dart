import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_news/news/controller/news_controller.dart';
import 'package:flutter_news/news/data/model/article_response.dart';
import 'package:flutter_news/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/news_item_widget.dart';

class LifestylePage extends StatefulWidget {
  const LifestylePage({Key? key}) : super(key: key);

  @override
  State<LifestylePage> createState() => _LifestylePageState();
}

class _LifestylePageState extends State<LifestylePage> {
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
    await newsController.getNews(q: "lifestyle-news", from: currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<List<NewsModel>>(
                stream: newsController.newsSteamController,
                builder: (context, snapshot) {
                  List<NewsModel> newsData = [];

                  if (snapshot.hasData) {
                    newsData = snapshot.data!;
                    news = newsData;
                  }
                  return Column(
                    children: List<Widget>.generate(news.length,
                        (index) => NewsItemWidget(news: news[index])),
                  );
                })
          ],
        ),
      ),
      //bottomNavigationBar: bottomNavigationBar(currentIndex),
    );
  }
}
