// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:crypto_quotient/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_textfieldformfield.dart';
import '../../controller/coin_search_provider.dart';
import '../../l10n/app_localizations.dart';

class CoinSearchScreen extends StatefulWidget {
  const CoinSearchScreen({super.key});

  @override
  _CoinSearchScreenState createState() => _CoinSearchScreenState();
}

class _CoinSearchScreenState extends State<CoinSearchScreen> {
  String? currentLang;
  final TextEditingController _searchController = TextEditingController();
  dynamic coinSearchData;
  bool _isLoading = false;

  bool _showCoins = true;
  bool _showExchanges = false;
  bool _showCategories = false;
  bool _showNfts = false;

  @override
  void initState() {
    super.initState();
  }

  void _searchCoins({String? query}) async {
    final query = _searchController.text;
    if (query.isEmpty) return;
    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<CoinSearchProvider>(context, listen: false)
          .fetchCoinSearchData(query);
    } catch (error) {
      debugPrint('Error fetching coin data: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleFilter(String filter) {
    setState(() {
      _showCoins = filter == 'coins';
      _showExchanges = filter == 'exchanges';
      _showCategories = filter == 'categories';
      _showNfts = filter == 'nfts';
    });
  }

  @override
  void dispose() {
    Provider.of<CoinSearchProvider>(context, listen: false).clearData();
    _searchController.dispose();
    coinSearchData = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentLang = Localizations.localeOf(context).languageCode;
    coinSearchData = Provider.of<CoinSearchProvider>(context).coinSearchData;

    return Scaffold(
      backgroundColor: lightBlueColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            AppTextFormField(
              appController: _searchController,
              hintText: AppLocalizations.translate('Search coin', currentLang!),
              maxLengthLine: 1,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: mainBlueColor,
                ),
                onPressed: _searchCoins,
              ),
              onFieldSubmitted: (val) {
                setState(() {
                  _searchCoins(query: val);
                });
              },
            ),
            const SizedBox(height: 20),
            // Filter buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _toggleFilter('coins'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _showCoins ? mainBlueColor : Colors.grey,
                    ),
                    child: Text(
                        AppLocalizations.translate('Coins', currentLang!),
                        style: const TextStyle(color: whiteColor)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _toggleFilter('exchanges'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _showExchanges ? mainBlueColor : Colors.grey,
                    ),
                    child: Text(
                        AppLocalizations.translate('Exchanges', currentLang!),
                        style: const TextStyle(color: whiteColor)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _toggleFilter('categories'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _showCategories ? mainBlueColor : Colors.grey,
                    ),
                    child: Text(
                        AppLocalizations.translate('Categories', currentLang!),
                        style: const TextStyle(color: whiteColor)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _toggleFilter('nfts'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _showNfts ? mainBlueColor : Colors.grey,
                    ),
                    child: Text(
                        AppLocalizations.translate('NFTs', currentLang!),
                        style: const TextStyle(color: whiteColor)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: coinSearchData == null
                        ? Center(
                            child: Text(AppLocalizations.translate(
                                'No Records', currentLang!)))
                        : ListView(
                            children: [
                              if (_showCoins &&
                                  coinSearchData.coins != null &&
                                  coinSearchData.coins!.isNotEmpty)
                                ...coinSearchData.coins!.map((coin) {
                                  return Card(
                                    color: const Color(0xFFC7E0D4),
                                    child: ListTile(
                                      leading: coin.thumb == "missing_thumb.png"
                                          ? const Text("")
                                          : Image.network(coin.thumb!),
                                      title: Text(coin.name ?? 'Unknown Coin'),
                                      subtitle: Text(coin.symbol ?? ''),
                                    ),
                                  );
                                }).toList(),
                              if (_showExchanges &&
                                  coinSearchData.exchanges != null &&
                                  coinSearchData.exchanges!.isNotEmpty)
                                ...coinSearchData.exchanges!.map((exchange) {
                                  return Card(
                                    color: const Color(0xFFC7E0D4),
                                    child: ListTile(
                                      leading:
                                          exchange.thumb == "missing_thumb.png"
                                              ? const Text("")
                                              : Image.network(exchange.thumb!),
                                      title: Text(
                                          exchange.name ?? 'Unknown Exchange'),
                                      subtitle: Text(exchange.id ?? ''),
                                    ),
                                  );
                                }).toList(),
                              if (_showCategories &&
                                  coinSearchData.categories != null &&
                                  coinSearchData.categories!.isNotEmpty)
                                ...coinSearchData.categories!.map((category) {
                                  return Card(
                                    color: const Color(0xFFC7E0D4),
                                    child: ListTile(
                                      title: Text(
                                        category.name ?? 'Unknown Category',
                                      ),
                                    ),
                                  );
                                }).toList(),
                              if (_showNfts &&
                                  coinSearchData.nfts != null &&
                                  coinSearchData.nfts!.isNotEmpty)
                                ...coinSearchData.nfts!.map((nft) {
                                  return Card(
                                    color: const Color(0xFFC7E0D4),
                                    child: ListTile(
                                      leading: nft.thumb == "missing_thumb.png"
                                          ? const Text("")
                                          : Image.network(nft.thumb ?? ""),
                                      title: Text(nft.name ?? 'Unknown NFT'),
                                      subtitle: Text(nft.symbol ?? ''),
                                    ),
                                  );
                                }).toList(),
                            ],
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}
