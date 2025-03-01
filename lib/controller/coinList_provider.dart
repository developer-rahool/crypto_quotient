// ignore_for_file: file_names

import 'package:crypto_quotient/models/coinlist_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../httpService.dart';

class CoinListProvider with ChangeNotifier {
  late Future<List<CoinListModel>> coinList;
  final ScrollController scrollController = ScrollController();
  bool showTopGainers = false;
  bool showTopLosers = false;
//
  PageController pageController = PageController();
  int currentIndex = 0;
  String imagePath = "assets/crypto/";
  List<String> imagesPath = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
    "6.jpg",
    "7.jpg",
    "8.jpg",
    "9.jpg",
    "10.jpg",
    "11.jpg",
  ];
  updateDots() {
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      notifyListeners();
    });
  }

  loadData(BuildContext context) async {
    coinList = Services().fetchCoins();
    showTopGainers = true;
    // scrollController.addListener(() {
    //   currentIndex =
    //       (scrollController.offset / (screenWidth(context) * 0.61 + 16))
    //           .toInt();
    // });
  }

  //
  clickGainer() {
    showTopGainers = true;
    showTopLosers = false;
    notifyListeners();
  }

  clickLooser() {
    showTopGainers = false;
    showTopLosers = true;
    notifyListeners();
  }

  // clickDefualt() {
  //   showTopGainers = false;
  //   showTopLosers = false;
  //   notifyListeners();
  // }

  List<CoinListModel> filterTopGainers(List<CoinListModel> cryptos) {
    cryptos.sort((a, b) =>
        b.priceChangePercentage24H.compareTo(a.priceChangePercentage24H));
    return cryptos; // Already sorted in descending order for top gainers
  }

  List<CoinListModel> filterTopLosers(List<CoinListModel> cryptos) {
    cryptos.sort((a, b) =>
        a.priceChangePercentage24H.compareTo(b.priceChangePercentage24H));
    return cryptos; // Sorted in ascending order for top losers
  }

  List<CoinListModel> defaultfilter(List<CoinListModel> cryptos) {
    return cryptos;
  }

  //
  String selectedPeriod = '1d';
  List<FlSpot> chartData = [];
  chartDataUpdate(var value) {
    chartData = value;
    notifyListeners();
  }

  onPeriodUpdate(var value) {
    selectedPeriod = value;
    notifyListeners();
  }
}
