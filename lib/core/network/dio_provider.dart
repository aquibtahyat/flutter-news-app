import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String endPoint =
    "https://newsapi.org/v2/everything?q=tesla&from=2023-05-01&sortBy=publishedAt&apiKey=4c6118d56721428c86ac6520cd048e25";

const int _maxLineWidth = 700;
final _prettyDioLogger = PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: true,
  responseHeader: false,
  error: true,
  compact: true,
  maxWidth: _maxLineWidth,
);

Dio httpDio({
  bool? shouldRetryOnError = true,
  String endUrl = "",
}) {
  final options = BaseOptions(
    baseUrl: "https://newsapi.org/v2/$endUrl",
  );

  Dio instance = Dio(options)..interceptors.add(_prettyDioLogger);
  return instance;
}
