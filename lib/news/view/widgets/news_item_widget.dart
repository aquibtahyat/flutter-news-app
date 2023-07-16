import 'package:flutter/material.dart';
import 'package:flutter_news/news/data/model/article_response.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsModel news;
  const NewsItemWidget({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int maxDescriptionLength = 150;
    String limitedDescription = news.description;
    if (limitedDescription.length > maxDescriptionLength) {
      limitedDescription =
          '${limitedDescription.substring(0, maxDescriptionLength)}...';
    }
    return GestureDetector(
      onTap: () {
        _launchUrl(news.url);
      },
      child: Card(
        child: Stack(
          children: [
            Image.network(
              news.urlToImage,
              fit: BoxFit.cover,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        limitedDescription,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
