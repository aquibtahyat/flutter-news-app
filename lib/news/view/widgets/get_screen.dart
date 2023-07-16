import 'package:flutter_news/news/view/business_page.dart';
import 'package:flutter_news/news/view/home_page.dart';
import 'package:flutter_news/news/view/sports_page.dart';

getScreen(int index) {
  switch (index) {
    case 0:
      return const HomePage();
    case 1:
      return const BusinessPage();
    case 2:
      return const SportsPage();
  }
}
