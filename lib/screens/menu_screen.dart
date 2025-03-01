import 'package:crypto_quotient/screens/MenuScreens/calculateTab.dart';
import 'package:crypto_quotient/screens/MenuScreens/coin_tab/coinTab.dart';
import 'package:crypto_quotient/screens/MenuScreens/newsTab.dart';
import 'package:crypto_quotient/screens/MenuScreens/searchTab.dart';
import 'package:crypto_quotient/screens/MenuScreens/trending_tab/trendingTab.dart';
import 'package:flutter/material.dart';
import 'package:crypto_quotient/const.dart';

import '../l10n/app_localizations.dart';

class MenuScreen extends StatefulWidget {
  final Function(String) onChangeLanguage;
  const MenuScreen({super.key, required this.onChangeLanguage});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? currentLang;
  var selectIndex = 0;
  final List<Widget> _tabList = [
    const CoinScreen(),
    const TrendingScreen(),
    const NewsScreen(),
    const CalculationScreen(),
    const CoinSearchScreen()
  ];

  @override
  void initState() {
    widget.onChangeLanguage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentLang = Localizations.localeOf(context).languageCode;
    return Scaffold(
      body: _tabList[selectIndex],
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: lightBlueColor,
        title: Text(
          "Lang: ${AppLocalizations.translate('lang', currentLang!)}",
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: mainBlueColor),
        ),
        actions: [
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            onSelected: widget.onChangeLanguage,
            icon: const Icon(Icons.workspaces_filled,
                size: 19, color: mainBlueColor),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'en',
                  child: Text('English'),
                ),
                const PopupMenuItem<String>(
                  value: 'zh',
                  child: Text('中文'),
                ),
                const PopupMenuItem<String>(
                  value: 'hi',
                  child: Text('हिन्दी'),
                ),
              ];
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 2,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedItemColor: midBlackColor,
          currentIndex: selectIndex,
          backgroundColor: const Color.fromARGB(255, 228, 248, 238),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.currency_exchange),
                label: AppLocalizations.translate('Coin', currentLang!)),
            BottomNavigationBarItem(
                icon: const Icon(Icons.trending_up_outlined),
                label: AppLocalizations.translate('Trending', currentLang!)),
            BottomNavigationBarItem(
                icon: const Icon(Icons.article_outlined),
                label: AppLocalizations.translate('Article', currentLang!)),
            BottomNavigationBarItem(
                icon: const Icon(Icons.control_point_duplicate_outlined),
                label: AppLocalizations.translate('Calculate', currentLang!)),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: AppLocalizations.translate('Search', currentLang!)),
          ],
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          }),
    );
  }
}
