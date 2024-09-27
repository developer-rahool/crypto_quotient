import 'package:crypto_quotient/app_textfieldformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../const.dart';
import '../../controller/news_provider.dart';
import '../../l10n/app_localizations.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final TextEditingController _searchController = TextEditingController();
  NewsProvider provider = NewsProvider();
  String? currentLang;
  String? languageSelected;

  @override
  void initState() {
    provider = context.read<NewsProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentLang = Localizations.localeOf(context).languageCode;
    // List<String> suggestedSearchEnglish = [
    //   'Bitcoin',
    //   'Ethereum',
    //   'Tether',
    //   'USD Coin',
    //   'Binance Coin',
    //   'Ripple',
    //   'Cardano',
    //   'Binance USD',
    // ];
    List<String> suggestedSearchWord = [
      AppLocalizations.translate('Bitcoin', currentLang!),
      AppLocalizations.translate('Ethereum', currentLang!),
      AppLocalizations.translate('Tether', currentLang!),
      AppLocalizations.translate('USD Coin', currentLang!),
      AppLocalizations.translate('Binance Coin', currentLang!),
      AppLocalizations.translate('Ripple', currentLang!),
      AppLocalizations.translate('Cardano', currentLang!),
      AppLocalizations.translate('Binance USD', currentLang!)
    ];
    return Scaffold(
      backgroundColor: lightBlueColor,
      body: Consumer<NewsProvider>(builder: (context, newsProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              AppTextFormField(
                appController: _searchController,
                hintText:
                    AppLocalizations.translate('Search article', currentLang!),
                maxLengthLine: 1,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: mainBlueColor,
                  ),
                  onPressed: () {
                    Provider.of<NewsProvider>(context, listen: false).fetchNews(
                        _searchController.text,
                        AppLocalizations.translate(
                            'langSelected', currentLang!));
                  },
                ),
                onFieldSubmitted: (value) {
                  Provider.of<NewsProvider>(context, listen: false).fetchNews(
                      value,
                      AppLocalizations.translate('langSelected', currentLang!));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: suggestedSearchWord.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _searchController.text = suggestedSearchWord[index];
                            Provider.of<NewsProvider>(context, listen: false)
                                .fetchNews(
                                    _searchController.text,
                                    AppLocalizations.translate(
                                        'langSelected', currentLang!));
                            // _searchController.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: suggestedSearchWord[index] ==
                                  _searchController.text
                              ? mainBlueColor
                              : Colors.grey,
                        ),
                        child: Text(
                          suggestedSearchWord[index],
                          style:
                              const TextStyle(color: whiteColor, fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),
              newsProvider.isLoading
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : newsProvider.articles.isEmpty
                      ? Expanded(
                          child: Center(
                              child: Text(AppLocalizations.translate(
                                  'No Records', currentLang!))))
                      : Expanded(
                          child: ListView.builder(
                            itemCount: newsProvider.articles.length,
                            itemBuilder: (context, index) {
                              final article = newsProvider.articles[index];
                              if (!article.urlToImage!.endsWith(".jpg") &&
                                  !article.urlToImage!.endsWith(".png")) {
                                article.urlToImage = "";
                              }
                              return Card(
                                color: whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (article.urlToImage!.isNotEmpty)
                                          SizedBox(
                                            //  width: 200,
                                            height: 200,
                                            child: Center(
                                              child: Image.network(
                                                fit: BoxFit.fill,
                                                article.urlToImage!,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Center(
                                                    child: Image.asset(
                                                        "assets/images/noimages.png"),
                                                  );
                                                },
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          article.title!,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(article.description!),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        if (article.author!.isNotEmpty)
                                          Text("Author: ${article.author}"),
                                      ],
                                    ),
                                    onTap: () async {
                                      final Uri url = Uri.parse(article.url!);
                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    },
                                  ),
                                ),
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
}
