import 'package:flutter/material.dart';
import 'package:flutter_news/news/data/model/article_response.dart';
import 'package:flutter_news/news/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class NewsController {
  final BehaviorSubject<List<NewsModel>> _newsController =
      BehaviorSubject<List<NewsModel>>();

  Stream<List<NewsModel>> get newsSteamController => _newsController.stream;

  final NewsRepository _fetchNews = NewsRepository();

  getNews({String? q, String? from}) async {
    List<NewsModel> newsList = await _fetchNews.fetchNews(q: q, from: from);

    _newsController.sink.add(newsList);
  }
}
