import 'package:crypto_quotient/const.dart';
import 'package:crypto_quotient/controller/coinList_provider.dart';
import 'package:crypto_quotient/httpService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/coinlist_model.dart';
import 'package:fl_chart/fl_chart.dart'; // Chart library

class CoinDetails extends StatefulWidget {
  final CoinListModel coin;
  const CoinDetails({super.key, required this.coin});

  @override
  // ignore: library_private_types_in_public_api
  _CoinDetailsState createState() => _CoinDetailsState();
}

class _CoinDetailsState extends State<CoinDetails> {
  String? currentLang;
  CoinListProvider coinListProvider = CoinListProvider();

  @override
  void initState() {
    super.initState();
    coinListProvider = context.read<CoinListProvider>();
    _fetchChartData();
  }

  _fetchChartData() async {
    List<FlSpot> data = await Services()
        .fetchChart(widget.coin.id, coinListProvider.selectedPeriod);
    coinListProvider.chartDataUpdate(data);
  }

  _onPeriodChange(String period) {
    coinListProvider.onPeriodUpdate(period);
    _fetchChartData();
  }

  // @override
  // void dispose() {
  //   coinListProvider.chartData.clear();
  //   coinListProvider.selectedPeriod = '1d';
  //   context.read<CoinListProvider>().loadData(context);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    currentLang = Localizations.localeOf(context).languageCode;
    return Scaffold(
      backgroundColor: const Color(0xFFE1ECF5),
      appBar: AppBar(
        title: Text(
          widget.coin.name,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: mainBlueColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trade Chart
            Consumer<CoinListProvider>(builder: (context, provider, child) {
              return SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: provider.chartData,
                        isCurved: false,
                        isStepLineChart: false,
                        color: mainBlueColor,
                        dotData: const FlDotData(show: false),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            // Period Selection Buttons
            Consumer<CoinListProvider>(builder: (context, provider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPeriodButton(
                      '1d', AppLocalizations.translate('1 Day', currentLang!)),
                  const SizedBox(width: 10),
                  _buildPeriodButton('15d',
                      AppLocalizations.translate('15 Days', currentLang!)),
                  const SizedBox(width: 10),
                  _buildPeriodButton('30d',
                      AppLocalizations.translate('30 Days', currentLang!)),
                ],
              );
            }),
            const SizedBox(height: 20),
            // Coin Information
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardGreenColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCoinDetail(
                      AppLocalizations.translate(
                          'Circulating Supply: ', currentLang!),
                      widget.coin.circulatingSupply.toString()),
                  _buildCoinDetail(
                      AppLocalizations.translate(
                          'Total Supply: ', currentLang!),
                      widget.coin.totalSupply.toString()),
                  _buildCoinDetail(
                      AppLocalizations.translate('ATH: ', currentLang!),
                      widget.coin.ath.toString()),
                  _buildCoinDetail(
                      AppLocalizations.translate(
                          'ATH Change %: ', currentLang!),
                      widget.coin.priceChangePercentage24H.toString()),
                  _buildCoinDetail(
                      AppLocalizations.translate('High 24H: ', currentLang!),
                      widget.coin.high24H.toString()),
                  _buildCoinDetail(
                      AppLocalizations.translate('Low 24H: ', currentLang!),
                      widget.coin.low24H.toString()),
                  _buildCoinDetail(
                      AppLocalizations.translate('Market Cap: ', currentLang!),
                      widget.coin.marketCap.toString()),
                  _buildCoinDetail(
                      AppLocalizations.translate(
                          'Market Cap Rank: ', currentLang!),
                      widget.coin.marketCapRank.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodButton(String period, String text) {
    return ElevatedButton(
      onPressed: () => _onPeriodChange(period),
      style: ElevatedButton.styleFrom(
        backgroundColor: coinListProvider.selectedPeriod == period
            ? mainBlueColor
            : Colors.blue[200],
      ),
      child: Text(text,
          style: const TextStyle(
              color: whiteColor, fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildCoinDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
