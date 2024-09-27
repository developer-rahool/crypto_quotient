class AppLocalizations {
  static const List<String> supportedLanguages = ['en', 'zh'];

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'lang': 'English',
      'No Records': 'No Records',
      'langSelected': 'en',
      //search screen
      'Coin': 'Coin',
      'Trending': 'Trending',
      'Article': 'Article',
      'Search': 'Search',
      'Caluculate': 'Caluculate',
      'Search coin': 'Search Coin',
      'Coins': 'Coins',
      'Exchanges': 'Exchanges',
      'Categories': 'Categories',
      'NFTs': 'NFTs',

      //article screen
      'Search article': 'Search article',
      'Bitcoin': 'Bitcoin',
      'Ethereum': 'Ethereum',
      'Tether': 'Tether',
      'USD Coin': 'USD Coin',
      'Binance Coin': 'Binance Coin',
      'Ripple': 'Ripple',
      'Cardano': 'Cardano',
      'Binance USD': 'Binance USD',

      //Trending screen
      'Trending NFTs': 'Trending NFTs',
      'Symbol: ': 'Symbol: ',
      'Coin Id: ': 'Coin Id: ',
      'Floor Price: ': 'Floor Price: ',
      'Floor Price BTC: ': 'Floor Price BTC: ',
      'Trending Coins': 'Trending Coins',

      //Coin screen
      'Top Gainers': 'Top Gainers',
      'Top Losers': 'Top Losers',
      'High 24H: ': 'High 24H: ',
      'Low 24H: ': 'Low 24H: ',
      'Market Cap: ': 'Market Cap: ',
      'Price Charge: ': 'Price Charge: ',

      //Coin Detail screen
      '15 Days': '15 Days',
      '1 Day': '1 Day',
      '30 Day': '30 Day',
      'Circulating Supply': 'Circulating Supply',
      'Total Supply': 'Total Supply',
      'ATH': 'ATH',
      'ATH Change %': 'ATH Change %',
      'Market Cap Rank: ': 'Market Cap Rank: ',
    },
    "zh": {
      "lang": "中文",
      "No Records": "没有记录",
      'langSelected': 'zh',

      //search screen
      "Coin": "硬币",
      "Trending": "趋势",
      "Article": "文章",
      "Search": "搜索",
      "Calculate": "计算",
      "Search coin": "搜索硬币",
      "Coins": "硬币",
      "Exchanges": "交易所",
      "Categories": "类别",
      "NFTs": "NFT",

      //article screen
      "Search article": "搜索文章",
      "Bitcoin": "比特币",
      "Ethereum": "以太坊",
      "Tether": "泰达币",
      "USD Coin": "美元币",
      "Binance Coin": "币安币",
      "Ripple": "瑞波币",
      "Cardano": "卡尔达诺",
      "Binance USD": "币安美元",

      //Trending screen
      "Trending NFTs": "热门NFT",
      "Symbol: ": "符号：",
      "Coin Id: ": "硬币ID：",
      "Floor Price: ": "地板价：",
      "Floor Price BTC: ": "地板价比特币：",
      "Trending Coins": "热门硬币",

      //Coin screen
      "Top Gainers": "涨幅榜",
      "Top Losers": "跌幅榜",
      "High 24H: ": "24小时最高价：",
      "Low 24H: ": "24小时最低价：",
      "Market Cap: ": "市值：",
      "Price Charge: ": "价格变化：",

      //Coin detail screen
      "15 Days": "15天",
      "1 Day": "1天",
      "30 Day": "30天",
      "Circulating Supply": "流通供应量",
      "Total Supply": "总供应量",
      "ATH": "历史最高价",
      "ATH Change %": "历史最高价变化%",
      "Market Cap Rank: ": "市值排名："
    },
    "hi": {
      "lang": "हिन्दी",
      "No Records": "कोई रिकॉर्ड नहीं",
      'langSelected': 'hi',
      //search screen
      "Coin": "सिक्का",
      "Trending": "प्रवृत्ति",
      "Article": "लेख",
      "Search": "खोज",
      "Calculate": "गणना",
      "Search coin": "सिक्के खोजें",
      "Coins": "सिक्के",
      "Exchanges": "विनिमय",
      "Categories": "श्रेणियाँ",
      "NFTs": "एनएफटी",

      //article screen
      "Search article": "लेख खोजें",
      "Bitcoin": "बिटकॉइन",
      "Ethereum": "ईथरियम",
      "Tether": "टेथर",
      "USD Coin": "यूएसडी कॉइन",
      "Binance Coin": "बाइनेंस कॉइन",
      "Ripple": "रिप्पल",
      "Cardano": "कार्डानो",
      "Binance USD": "बाइनेंस यूएसडी",

      //Trending screen
      "Trending NFTs": "ट्रेंडिंग एनएफटी",
      "Symbol: ": "प्रतीक:",
      "Coin Id: ": "सिक्का आईडी:",
      "Floor Price: ": "फ्लोर मूल्य:",
      "Floor Price BTC: ": "फ्लोर मूल्य बीटीसी:",
      "Trending Coins": "ट्रेंडिंग सिक्के",

      //Coin screen
      "Top Gainers": "शीर्ष लाभकर्ता",
      "Top Losers": "शीर्ष हारने वाले",
      "High 24H: ": "24 घंटे का उच्चतम:",
      "Low 24H: ": "24 घंटे का न्यूनतम:",
      "Market Cap: ": "मार्केट कैप:",
      "Price Charge: ": "मूल्य शुल्क:",

      //Coin detail screen
      "15 Days": "15 दिन",
      "1 Day": "1 दिन",
      "30 Day": "30 दिन",
      "Circulating Supply": "परिसंचारी आपूर्ति",
      "Total Supply": "कुल आपूर्ति",
      "ATH": "एटीएच",
      "ATH Change %": "एटीएच परिवर्तन %",
      "Market Cap Rank: ": "मार्केट कैप रैंक:"
    }
  };

  static String translate(String key, String languageCode) {
    return _localizedValues[languageCode]![key] ?? key;
  }
}
