import 'dart:convert';
import 'package:crypto_quotient/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews(String query, String lang) async {
    _isLoading = true;

    const baseUrl = "https://newsapi.org/v2/everything";
    const apiKey =
        "90fa159cf6b240dc957c6932f7707be5"; // Replace with your API key
   // const deviceLanguage = "en";

    try {
      final response = await http.get(Uri.parse(
          '$baseUrl?q=$query&language=$lang&apiKey=$apiKey'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final newsResponse = NewsModel.fromJson(jsonData);
        _articles = newsResponse.articles;
        _articles.removeWhere(
          (element) =>
              element.title == "[Removed]" &&
              element.description == "[Removed]",
        );
      } else {
        print("Failed to fetch news: ${response.statusCode}");
      }
    } catch (error) {
      print("Error: $error");
    }

    _isLoading = false;
    notifyListeners();
  }
}

//  https://newsapi.org/v2/everything?q=bitcoin&language=en&apiKey=90fa159cf6b240dc957c6932f7707be5