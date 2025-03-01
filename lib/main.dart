import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto_quotient/const.dart';
import 'package:crypto_quotient/controller/single_coin_provider.dart';
import 'package:crypto_quotient/controller/coin_search_provider.dart';
import 'package:crypto_quotient/controller/coinList_provider.dart';
import 'package:crypto_quotient/controller/trending_provider.dart';
import 'controller/news_provider.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

bool? isOnBoarding;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pres = await SharedPreferences.getInstance();
  isOnBoarding = pres.getBool("onboarding") ?? false;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // Default language

  void _changeLanguage(String languageCode) {
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CoinListProvider()),
        ChangeNotifierProvider(create: (context) => TrendingProvider()),
        ChangeNotifierProvider(create: (context) => SingleCoinProvider()),
        ChangeNotifierProvider(create: (context) => CoinSearchProvider()),
        ChangeNotifierProvider(create: (context) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'crypto_quotient',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: midBlackColor,
          colorScheme: ColorScheme.fromSeed(seedColor: darkBlackColor),
          useMaterial3: true,
        ),
        //
        locale: _locale,
        supportedLocales: const [
          Locale('en', ''),
          Locale('zh', ''),
          Locale('hi', ''),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //
        home: SplashScreen(
          onChangeLanguage: _changeLanguage,
        ),
      ),
    );
  }
}
