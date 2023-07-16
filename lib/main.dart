import 'package:flutter/material.dart';
import 'package:flutter_news/routes/route_generator.dart';
import 'package:flutter_news/routes/news_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: false,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
