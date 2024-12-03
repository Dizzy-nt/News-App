class Article {
  final String title;
  final String? description;
  final String imageUrl;
  final String? content;
  final String url;
  final String? author;
  final String? publishedAt;
  Article({
    required this.title,
    this.description,
    required this.imageUrl,
    this.content,
    required this.url,
    this.author,
    this.publishedAt,
  });
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No title',
      description: json['description'],
      imageUrl: json['urlToImage'] ?? 'https://via.placeholder.com/200',
      content: json['content'],
      url: json['url'] ?? '',
      author: json['author'],
      publishedAt: json['publishedAt'],
    );
  }
}
