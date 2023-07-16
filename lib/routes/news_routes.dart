import 'package:flutter/material.dart';
import 'package:flutter_news/news/view/dashboard_screen.dart';
import 'package:flutter_news/news/view/business_page.dart';
import 'package:flutter_news/news/view/entertainment_page.dart';
import 'package:flutter_news/news/view/home_page.dart';
import 'package:flutter_news/news/view/life_style/lifestyle_page.dart';
import 'package:flutter_news/news/view/sports_page.dart';
import 'package:flutter_news/news/view/technology_page.dart';
import 'package:flutter_news/news/view/widgets/home_drawer.dart';

abstract class NewsRoutes {
  static const String homeRoute = "/home";
  static const String businessRoute = "/business";
  static const String sportsRoute = "/sports";
  static const String entertainmentRoute = "/entertainment";
  static const String technologyRoute = "/technology";
  static const String lifestyleRoute = "/lifestle";
}

MaterialPageRoute? getNewsRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const DashboardScreen());
    case NewsRoutes.homeRoute:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case NewsRoutes.businessRoute:
      return MaterialPageRoute(builder: (_) => const BusinessPage());
    case NewsRoutes.sportsRoute: // Fixed case here
      return MaterialPageRoute(builder: (_) => const SportsPage());
    case NewsRoutes.entertainmentRoute: // Fixed case here
      return MaterialPageRoute(builder: (_) => const EntertainmentPage());
    case NewsRoutes.technologyRoute: // Fixed case here
      return MaterialPageRoute(builder: (_) => const TechnologyPage());
    case NewsRoutes.lifestyleRoute: // Fixed case here
      return MaterialPageRoute(builder: (_) => const LifestylePage());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
