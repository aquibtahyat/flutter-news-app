import 'package:flutter/material.dart';
import 'package:flutter_news/routes/news_routes.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    MaterialPageRoute? page;

    page = getNewsRoute(settings);
    if (page != null) return page;

    return page;
  }
}
