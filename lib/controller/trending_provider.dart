import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/search_coin_model.dart'
    hide Nft; // Hide Nft to avoid conflict
import '../models/trending_model.dart';

class TrendingProvider with ChangeNotifier {
  TrendingModel? trendingData;
  bool isLoading = false;

  Future<void> fetchTrendingData() async {
    final url = Uri.parse('https://api.coingecko.com/api/v3/search/trending');
    isLoading = true;

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        trendingData = TrendingModel.fromJson(jsonData);
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<CoinItem>? get coins => trendingData?.coins?.map((e) => e).toList();
  List<Nft>? get nfts => trendingData?.nfts;
}
