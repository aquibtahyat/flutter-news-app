import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_news/app_fonts/app_fonts.dart';
import 'package:flutter_news/news/data/enum/menu_code.dart';
import 'package:flutter_news/routes/news_routes.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF598BDE)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: const Icon(Icons.close),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'More Flutter News',
                      style: raleway.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: List<Widget>.generate(
                  MenuCode.values.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      getMenuNavigation(context, MenuCode.values[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        color: Colors.white60,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            getMenuCode(
                              MenuCode.values[index],
                            ),
                            style: playfair.copyWith(
                              color: const Color(0xFF598BDE),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              exit(0);
            },
            child: Card(
              color: const Color(0xFF598BDE),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Exit App",
                  style: raleway.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  getMenuNavigation(BuildContext context, MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.entertainment:
        Navigator.pushNamed(context, NewsRoutes.entertainmentRoute);
      case MenuCode.technology:
        Navigator.pushNamed(context, NewsRoutes.technologyRoute);
      case MenuCode.lifestyle:
        Navigator.pushNamed(context, NewsRoutes.lifestyleRoute);
    }
  }
}
