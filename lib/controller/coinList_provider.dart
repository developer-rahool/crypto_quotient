import 'package:crypto_quotient/models/coinlist_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../httpService.dart';

class CoinListProvider with ChangeNotifier {
  late Future<List<CoinList>> coinList;
  final ScrollController scrollController = ScrollController();
  bool showTopGainers = false;
  bool showTopLosers = false;
//
  PageController pageController = PageController();
  int currentIndex = 0;
  List<String> imagesPath = [
    "assets/crypto/1.jpg",
    "assets/crypto/2.jpg",
    "assets/crypto/3.jpg",
    "assets/crypto/4.jpg",
    "assets/crypto/5.jpg",
    "assets/crypto/6.jpg",
    "assets/crypto/7.jpg",
    "assets/crypto/8.jpg",
    "assets/crypto/9.jpg",
    "assets/crypto/10.jpg",
    "assets/crypto/11.png",
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

  List<CoinList> filterTopGainers(List<CoinList> cryptos) {
    cryptos.sort((a, b) =>
        b.priceChangePercentage24H.compareTo(a.priceChangePercentage24H));
    return cryptos; // Already sorted in descending order for top gainers
  }

  List<CoinList> filterTopLosers(List<CoinList> cryptos) {
    cryptos.sort((a, b) =>
        a.priceChangePercentage24H.compareTo(b.priceChangePercentage24H));
    return cryptos; // Sorted in ascending order for top losers
  }

  List<CoinList> defaultfilter(List<CoinList> cryptos) {
    return cryptos;
  }

  //
  String selectedPeriod = '1d';
  List<FlSpot> chartData = [];
  ChartDataUpdate(var value) {
    chartData = value;
    notifyListeners();
  }

  onPeriodUpdate(var value) {
    selectedPeriod = value;
    notifyListeners();
  }
}
