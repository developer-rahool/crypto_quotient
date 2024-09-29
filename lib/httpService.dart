import 'dart:convert';

import 'package:crypto_quotient/models/coinlist_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String _baseUrl =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd';

  Future<List<CoinListModel>> fetchCoins() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<CoinListModel> coins =
          body.map((dynamic item) => CoinListModel.fromJson(item)).toList();
      return coins;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  Future<List<FlSpot>> fetchChart(String coinId, String period) async {
    String url =
        'https://api.coingecko.com/api/v3/coins/$coinId/market_chart?vs_currency=usd&days=$period';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> prices = json.decode(response.body)['prices'];
      List<FlSpot> chartData = prices
          .asMap()
          .entries
          .map((entry) =>
              FlSpot(entry.key.toDouble(), entry.value[1].toDouble()))
          .toList();
      return chartData;
    } else {
      throw Exception('Failed to load chart data');
    }
  }
}
