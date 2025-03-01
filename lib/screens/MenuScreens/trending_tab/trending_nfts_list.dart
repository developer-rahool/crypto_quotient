// ignore_for_file: must_be_immutable

import 'package:crypto_quotient/models/trending_model.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../l10n/app_localizations.dart';

class TrendingNFTSData extends StatefulWidget {
  ItemData? data;
  TrendingNFTSData({super.key, required this.data});

  @override
  State<TrendingNFTSData> createState() => _TrendingNFTSDataState();
}

class _TrendingNFTSDataState extends State<TrendingNFTSData> {
  String? currentLang;
  @override
  Widget build(BuildContext context) {
    currentLang = Localizations.localeOf(context).languageCode;
    return Scaffold(
      backgroundColor: const Color(0xFFE1ECF5),
      appBar: AppBar(
        title: Text(
          AppLocalizations.translate('Price Change Percentage', currentLang!),
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: mainBlueColor),
        ),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icons.arrow_back_ios_new_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.translate('Price: ', currentLang!),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: mainBlueColor),
                ),
                Text(
                  widget.data!.price.toString(),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: mainBlueColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.translate('Price BTC: ', currentLang!),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: mainBlueColor),
                ),
                Text(
                  widget.data!.priceBtc.toString(),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: mainBlueColor),
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.data!.priceChangePercentage24H!.length,
                  itemBuilder: (context, index) {
                    var keys =
                        widget.data!.priceChangePercentage24H!.keys.toList();
                    var values =
                        widget.data!.priceChangePercentage24H!.values.toList();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: cardGreenColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                keys[index].toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: mainBlueColor),
                              ),
                              Text(
                                values[index].toStringAsFixed(8).toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: mainBlueColor),
                              ),
                            ],
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
