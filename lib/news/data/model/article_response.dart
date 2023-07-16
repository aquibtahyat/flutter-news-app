class NewsModel {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'Behind the secret',
        title: json["title"] ?? 'Non title',
        description: json["description"] ?? ' ',
        url: json["url"] ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn4pXvg4RQtlqbkDymFjAC481hWnnd-BQO2Q&usqp=CAU',
        urlToImage: json["urlToImage"] ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn4pXvg4RQtlqbkDymFjAC481hWnnd-BQO2Q&usqp=CAU',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? ' ',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  dynamic id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
