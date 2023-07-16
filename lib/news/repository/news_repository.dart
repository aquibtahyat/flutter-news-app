import 'package:flutter_news/core/network/dio_provider.dart';

import '../data/model/article_response.dart';

class NewsRepository {
  Future<List<NewsModel>> fetchNews({String? q, String? from}) async {
    try {
      const endPoint = '/everything';

      final queryParams = {
        "q": q,
        "from": from,
        "sortBy": "publishedAt",
        "apiKey": "4c6118d56721428c86ac6520cd048e25"
      };

      final response =
          await httpDio().get(endPoint, queryParameters: queryParams);
      // print(response);

      if (response.statusCode == 200) {
        final jsonData = response.data;

        List<NewsModel> news = (jsonData['articles'] as List<dynamic>)
            .map((itemJson) => NewsModel.fromJson(itemJson))
            .toList();
        return news;
      } else {
        throw Exception('Failed to load data.');
      }
    } catch (e) {
      throw Exception('Failed to fetch posts. Status code: $e');
    }
  }
}
