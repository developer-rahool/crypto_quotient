import 'package:crypto_quotient/const.dart';
import 'package:crypto_quotient/controller/coinList_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/coinlist_model.dart';
import 'coin_details_screen.dart';

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  CoinListProvider? coinListProvider;
  String? currentLang;

  @override
  void initState() {
    super.initState();
    coinListProvider = context.read<CoinListProvider>();
    coinListProvider!.loadData(context);
    coinListProvider!.updateDots();
  }

  // @override
  // void dispose() {
  //   coinListProvider!.scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    currentLang = Localizations.localeOf(context).languageCode;
    return Scaffold(
      backgroundColor: lightBlueColor,
      body: Consumer<CoinListProvider>(builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              //
              SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Expanded(
                    child: PageView.builder(
                      controller: coinListProvider!.pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: coinListProvider!.imagesPath.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          coinListProvider!.imagesPath[index],
                          fit: BoxFit.cover,
                          scale: 5,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildDots(coinListProvider!),
              const SizedBox(height: 16),
              //

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      provider.clickGainer();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          provider.showTopGainers
                              ? mainBlueColor
                              : Colors.grey),
                    ),
                    child: Text(
                        AppLocalizations.translate("Top Gainers", currentLang!),
                        style: const TextStyle(color: whiteColor)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      provider.clickLooser();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          provider.showTopLosers ? mainBlueColor : Colors.grey),
                    ),
                    child: Text(
                      AppLocalizations.translate("Top Losers", currentLang!),
                      style: const TextStyle(color: whiteColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: FutureBuilder<List<CoinListModel>>(
                  future: provider.coinList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(AppLocalizations.translate(
                              'Sorry! Service got down, try again.',
                              currentLang!)));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                          child: Text(AppLocalizations.translate(
                              'No Records', currentLang!)));
                    }

                    List<CoinListModel> coins = snapshot.data!;

                    if (provider.showTopGainers) {
                      coins = provider.filterTopGainers(coins);
                    } else if (provider.showTopLosers) {
                      coins = provider.filterTopLosers(coins);
                    }

                    return ListView.builder(
                      itemCount: coins.length,
                      itemBuilder: (context, index) {
                        final coin = coins[index];

                        return GestureDetector(
                          onTap: () {
                            nextPage(context, CoinDetails(coin: coin));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: cardGreenColor,
                                  borderRadius: BorderRadius.circular(15)),
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
                                            Image.network(coin.image,
                                                width: 40),
                                            const SizedBox(width: 6),
                                            SizedBox(
                                              width:
                                                  screenWidth(context) * 0.29,
                                              child: Text(
                                                coin.name,
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
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: coin
                                                      .priceChangePercentage24H
                                                      .isNegative
                                                  ? Colors.red
                                                  : Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                            '${coin.priceChangePercentage24H}',
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
                                                  'High 24H: ', currentLang!),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${coin.high24H}',
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
                                                  'Low 24H: ', currentLang!),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: darkBlackColor,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${coin.low24H}',
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
                                                    'Market Cap: ',
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
                                                '${coin.marketCap}',
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
                                                    'Current Price: ',
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
                                                '\$${coin.currentPrice}',
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
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDots(CoinListProvider? coinListProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(coinListProvider!.imagesPath.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: coinListProvider.currentIndex == index ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: coinListProvider.currentIndex == index
                ? mainBlueColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
