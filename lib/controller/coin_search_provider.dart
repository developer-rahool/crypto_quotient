import 'package:crypto_quotient/models/search_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinSearchProvider with ChangeNotifier {
  CoinSearchModel? _coinSearchData;

  CoinSearchModel? get coinSearchData => _coinSearchData;

  Future<void> fetchCoinSearchData(String query) async {
    final url = 'https://api.coingecko.com/api/v3/search?query=$query';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _coinSearchData = CoinSearchModel.fromJson(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw error;
    }
  }

  // Method to clear the data
  void clearData() {
    _coinSearchData = null;
    notifyListeners();
  }
}
