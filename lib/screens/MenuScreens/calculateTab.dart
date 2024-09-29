import 'package:crypto_quotient/app_textfieldformfield.dart';
import 'package:crypto_quotient/controller/coinList_provider.dart';
import 'package:crypto_quotient/controller/single_coin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const.dart';
import '../../l10n/app_localizations.dart';
import '../../models/single_coin_model.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _quatityController = TextEditingController();
  final TextEditingController _pricepercoinController = TextEditingController();
  late SingleCoinProvider coinProvider;
  String? currentLang;

  @override
  void initState() {
    super.initState();
    coinProvider = context.read<SingleCoinProvider>();
  }

  String resultMessage = "";

  void calculateValues(
      {double? currentPriceData, String? quantity, String? pricePerCoin}) {
    // Extract user input
    String coinQuantityText = quantity!;
    String coinPerRateText = pricePerCoin!;

    double? coinQuantity = double.tryParse(coinQuantityText);
    double? coinPerRate = double.tryParse(coinPerRateText);

    if (coinQuantity == null || coinPerRate == null) {
      _showAlert(
          "Please enter valid values for coin quantity and purchase price.");
      return;
    }

    // Get current price
    double? currentPrice = currentPriceData!;

    // Calculate values
    double initialInvestment = coinQuantity * coinPerRate;
    double currentValue = coinQuantity * currentPrice;
    double profitOrLoss = currentValue - initialInvestment;
    double costIfBoughtAtCurrentRate = coinQuantity * currentPrice;
    double savingsOrLoss = initialInvestment - costIfBoughtAtCurrentRate;

    // Additional Calculations
    double percentageChangeFromPurchase =
        ((currentPrice - coinPerRate) / coinPerRate) * 100;
    double roi = ((currentValue - initialInvestment) / initialInvestment) * 100;
    //double amountSavedOrLost = initialInvestment - costIfBoughtAtCurrentRate;

    // Format results
    String profitOrLossString = profitOrLoss >= 0
        ? "${AppLocalizations.translate('Profit', currentLang!)}: ${profitOrLoss.toStringAsFixed(2)} USDT"
        : "${AppLocalizations.translate('Loss', currentLang!)}: ${(-profitOrLoss).toStringAsFixed(2)} USDT";

    String savingsOrLossString = savingsOrLoss >= 0
        ? "${AppLocalizations.translate('Savings', currentLang!)}: ${savingsOrLoss.toStringAsFixed(2)} USDT"
        : "${AppLocalizations.translate('Loss', currentLang!)}: ${(-savingsOrLoss).toStringAsFixed(2)} USDT";

    String percentageChangeString = percentageChangeFromPurchase >= 0
        ? "${AppLocalizations.translate('Change', currentLang!)} %: ${percentageChangeFromPurchase.toStringAsFixed(2)}% (${AppLocalizations.translate('Increase', currentLang!)})"
        : "${AppLocalizations.translate('Change', currentLang!)} %: ${(-percentageChangeFromPurchase).toStringAsFixed(2)}% (${AppLocalizations.translate('Decrease', currentLang!)})";

    String roiString = roi >= 0
        ? "${AppLocalizations.translate('ROI', currentLang!)}: ${roi.toStringAsFixed(2)}% (${AppLocalizations.translate('Return', currentLang!)})"
        : "${AppLocalizations.translate('ROI', currentLang!)}: ${(-roi).toStringAsFixed(2)}% (${AppLocalizations.translate('Loss', currentLang!)})";

    // Prepare result message
    resultMessage = """
      \n      ${AppLocalizations.translate('Initial Investment', currentLang!)}: ${initialInvestment.toStringAsFixed(2)} USDT
      ${AppLocalizations.translate('Current Value', currentLang!)}: ${currentValue.toStringAsFixed(2)} USDT
      $profitOrLossString
      ${AppLocalizations.translate('Current Rate', currentLang!)}: ${costIfBoughtAtCurrentRate.toStringAsFixed(2)} USDT
      $savingsOrLossString
      $percentageChangeString
      $roiString
    """;

    setState(() {});
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.translate('Alert', currentLang!),
          style: const TextStyle(
              color: mainBlueColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(AppLocalizations.translate('OK', currentLang!),
                style: const TextStyle(
                    color: mainBlueColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  //

  @override
  void dispose() {
    resultMessage = "";
    coinProvider.coin.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentLang = Localizations.localeOf(context).languageCode;

    List<String> suggestedSearchWord = [
      AppLocalizations.translate('Bitcoin', currentLang!),
      AppLocalizations.translate('Ethereum', currentLang!),
      AppLocalizations.translate('Tether', currentLang!),
      AppLocalizations.translate('Dogecoin', currentLang!),
      AppLocalizations.translate('Stellar', currentLang!),
      AppLocalizations.translate('Tron', currentLang!),
      AppLocalizations.translate('Gala', currentLang!),
    ];

    List<String> suggestedSearchWordEnlish = [
      'Bitcoin',
      'Ethereum',
      'Tether',
      'Dogecoin',
      'Stellar',
      'Tron',
      'Gala',
    ];

    return Scaffold(
      backgroundColor: lightBlueColor,
      body: Consumer<SingleCoinProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              AppTextFormField(
                appController: _searchController,
                hintText:
                    AppLocalizations.translate('Search coin', currentLang!),
                maxLengthLine: 1,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: mainBlueColor),
                  onPressed: () {
                    resultMessage = "";
                    _quatityController.clear();
                    _pricepercoinController.clear();
                    context.read<SingleCoinProvider>().fetchSingleCoin(
                        query: _searchController.text.trim().toLowerCase());
                  },
                ),
                onFieldSubmitted: (value) {
                  resultMessage = "";
                  _quatityController.clear();
                  _pricepercoinController.clear();
                  context.read<SingleCoinProvider>().fetchSingleCoin(
                      query: _searchController.text.trim().toLowerCase());
                },
              ),
              const SizedBox(height: 10),
              _buildSuggestedSearch(
                  suggestedSearchWord, suggestedSearchWordEnlish),
              resultMessage == ""
                  ? provider.isLoading
                      ? const Expanded(
                          child: Center(child: CircularProgressIndicator()))
                      : provider.coin.isEmpty
                          ? Expanded(
                              child: Center(
                                  child: Text(AppLocalizations.translate(
                                      'No Records', currentLang!))))
                          : _buildCoinList(provider)
                  : const SizedBox(
                      height: 20,
                    ),
              provider.coin.isNotEmpty
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppTextFormField(
                                appController: _quatityController,
                                hintText: AppLocalizations.translate(
                                    'Quantity', currentLang!),
                                maxLengthLine: 1,
                                onFieldSubmitted: (value) {
                                  context
                                      .read<SingleCoinProvider>()
                                      .fetchSingleCoin(
                                          query: _searchController.text
                                              .trim()
                                              .toLowerCase());
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AppTextFormField(
                                appController: _pricepercoinController,
                                hintText: AppLocalizations.translate(
                                    'Price per coin', currentLang!),
                                maxLengthLine: 1,
                                onFieldSubmitted: (value) {
                                  context
                                      .read<SingleCoinProvider>()
                                      .fetchSingleCoin(
                                          query: _searchController.text
                                              .trim()
                                              .toLowerCase());
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 11),
                        SizedBox(
                          width: 130,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              double currentPrice =
                                  provider.coin.first.currentPrice.toDouble();
                              calculateValues(
                                  currentPriceData: currentPrice,
                                  quantity: _quatityController.text,
                                  pricePerCoin: _pricepercoinController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: mainBlueColor),
                            child: Text(
                              AppLocalizations.translate(
                                  'Calculate', currentLang!),
                              style: const TextStyle(
                                  color: whiteColor, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 11),
                        resultMessage != ""
                            ? Container(
                                width: screenWidth(context),
                                decoration: BoxDecoration(
                                  color: cardBlueColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(resultMessage,
                                    style: const TextStyle(fontSize: 16)),
                              )
                            : const SizedBox(),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        );
      }),
    );
  }

  // Extracted method for suggested search buttons
  Widget _buildSuggestedSearch(List<String> suggestedSearchWord,
      List<String> suggestedSearchWordEnglish) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suggestedSearchWord.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                resultMessage = "";
                _quatityController.clear();
                _pricepercoinController.clear();
                _searchController.text = suggestedSearchWordEnglish[index];
                context
                    .read<SingleCoinProvider>()
                    .fetchSingleCoin(query: _searchController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    suggestedSearchWordEnglish[index] == _searchController.text
                        ? mainBlueColor
                        : Colors.grey,
              ),
              child: Text(
                suggestedSearchWord[index],
                style: const TextStyle(color: whiteColor, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }

  // Extracted method for building the coin list
  Widget _buildCoinList(SingleCoinProvider provider) {
    return Expanded(
      child: ListView.builder(
        itemCount: provider.coin.length,
        itemBuilder: (context, index) {
          final coin = provider.coin[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: cardBlueColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(coin.image, width: 40),
                            const SizedBox(width: 6),
                            SizedBox(
                              width: screenWidth(context) * 0.28,
                              child: Text(
                                coin.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        _buildCoinPrice(coin.priceChangePercentage24H),
                      ],
                    ),
                    const SizedBox(height: 6),
                    _buildCoinStats(coin),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Extracted widget for displaying coin price
  Widget _buildCoinPrice(double priceChange) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        color: priceChange.isNegative ? Colors.red : Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '$priceChange',
          style: const TextStyle(
            fontSize: 13,
            color: whiteColor,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  // Extracted widget for displaying coin statistics
  Widget _buildCoinStats(SingleCoinModel coin) {
    return Column(
      children: [
        _buildStatRow('High 24H: ', '${coin.high24H}'),
        _buildStatRow('Low 24H: ', '${coin.low24H}'),
        _buildStatRow('Market Cap: ', '${coin.marketCap}'),
        _buildStatRow('Current Price: ', '\$${coin.currentPrice}%'),
      ],
    );
  }

  // Helper function for creating rows of stats
  Widget _buildStatRow(String label, String value) {
    return Row(
      children: [
        Text(
          AppLocalizations.translate(label, currentLang!),
          style: const TextStyle(
            fontSize: 16,
            color: darkBlackColor,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: darkBlackColor,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
