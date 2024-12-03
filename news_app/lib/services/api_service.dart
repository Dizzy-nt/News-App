import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class ApiService {
  final String apiKey = '6309371348b843fdbe2e026c27031561';
  final String apiUrl =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=';

  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('$apiUrl$apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List articles = data['articles'];
      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
