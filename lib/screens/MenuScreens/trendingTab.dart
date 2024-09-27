import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../controller/trending_provider.dart';
import '../../l10n/app_localizations.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  String? currentLang;
  @override
  void initState() {
    super.initState();
    Provider.of<TrendingProvider>(context, listen: false).fetchTrendingData();
  }

  @override
  Widget build(BuildContext context) {
    currentLang = Localizations.localeOf(context).languageCode;
    return Scaffold(
      backgroundColor: lightBlueColor,
      body: Consumer<TrendingProvider>(
        builder: (context, trendingProvider, child) {
          // Show loading spinner while fetching data
          if (trendingProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check if no data is available
          if (trendingProvider.trendingData == null) {
            return Center(
                child: Text(
                    AppLocalizations.translate('No Records', currentLang!)));
          }

          // Get the lists of coins and NFTs
          final coins = trendingProvider.coins ?? [];
          final nfts = trendingProvider.nfts ?? [];

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                if (nfts.isNotEmpty) ...[
                  Text(
                    AppLocalizations.translate('Trending NFTs', currentLang!),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mainBlueColor),
                  ),
                  SizedBox(
                    height: 190,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: nfts.length,
                      itemBuilder: (context, index) {
                        final nft = nfts[index];
                        return GestureDetector(
                          // onTap: () {
                          //   // nextPage(context, CoinDetails(coin: coin));
                          // },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: cardBlueColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(nft.thumb!,
                                                width: 40),
                                            const SizedBox(width: 8),
                                            SizedBox(
                                              width: screenWidth(context) * 0.4,
                                              child: Text(
                                                nft.name!,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.translate(
                                                  'Symbol: ', currentLang!),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${nft.symbol}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.translate(
                                                  'Coin Id: ', currentLang!),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${nft.nftContractId}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                AppLocalizations.translate(
                                                    'Floor Price: ',
                                                    currentLang!),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: darkBlackColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                '${nft.data!.floorPrice}',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: darkBlackColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                AppLocalizations.translate(
                                                    'Floor Price BTC: ',
                                                    currentLang!),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: darkBlackColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                '${nft.data!.floorPriceInUsd24HPercentageChange}',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: darkBlackColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          )
                                        ])
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
                const Divider(),
                if (coins.isNotEmpty) ...[
                  Text(
                    AppLocalizations.translate('Trending Coins', currentLang!),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mainBlueColor),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: coins.length,
                      itemBuilder: (context, index) {
                        final coin = coins[index];
                        return GestureDetector(
                          // onTap: () {
                          //   // nextPage(context, CoinDetails(coin: coin));
                          // },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: cardBlueColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(coin.thumb!,
                                                width: 40),
                                            const SizedBox(width: 6),
                                            SizedBox(
                                              width: screenWidth(context) * 0.3,
                                              child: Text(
                                                coin.name!,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: mainBlueColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                            '#${coin.marketCapRank ?? '-'}',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: whiteColor,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.translate(
                                                  'Symbol: ', currentLang!),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${coin.symbol}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppLocalizations.translate(
                                                  'Coin Id: ', currentLang!),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${coin.id}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
