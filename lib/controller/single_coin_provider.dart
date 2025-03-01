import 'dart:convert';
import 'package:crypto_quotient/models/single_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleCoinProvider with ChangeNotifier {
  List<SingleCoinModel> _coin = [];
  bool _isLoading = false;

  List<SingleCoinModel> get coin => _coin;
  bool get isLoading => _isLoading;

  fetchSingleCoin({String? query}) async {
    _isLoading = true;
    var qeuryy = query!.isEmpty ? "-" : query;
    notifyListeners(); // Notify listeners right after setting loading to true

    const String baseUrl =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd";

    try {
      var response =
          await http.get(Uri.parse('$baseUrl&ids=${qeuryy.toLowerCase()}'));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        _coin =
            body.map((dynamic item) => SingleCoinModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load coin data');
      }
    } catch (error) {
      debugPrint('Error fetching coin: $error');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify once loading is done and data is available
    }
  }
}
