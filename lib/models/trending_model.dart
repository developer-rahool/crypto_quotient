import 'search_coin_model.dart'; // Ensure this file contains the definition of `Coin`

class CoinItem {
  Coin coin;

  CoinItem({required this.coin});

  factory CoinItem.fromJson(Map<String, dynamic> json) => CoinItem(
        coin: Coin.fromJson(json['item']),
      );

  Map<String, dynamic> toJson() => {
        'item': coin.toJson(),
      };
}

class TrendingModel {
  List<CoinItem>? coins;
  List<Nft>? nfts;

  TrendingModel({
    this.coins,
    this.nfts,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
        coins: json['coins'] != null
            ? List<CoinItem>.from(
                json['coins'].map((x) => CoinItem.fromJson(x)))
            : null,
        nfts: json['nfts'] != null
            ? List<Nft>.from(json['nfts'].map((x) => Nft.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'coins': coins?.map((x) => x.toJson()).toList(),
        'nfts': nfts?.map((x) => x.toJson()).toList(),
      };
}

class Category {
  int? id;
  String? name;
  double? marketCap1HChange;
  String? slug;
  int? coinsCount;
  CategoryData? data;

  Category({
    this.id,
    this.name,
    this.marketCap1HChange,
    this.slug,
    this.coinsCount,
    this.data,
  });

  // Factory constructor for creating Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        marketCap1HChange: (json['marketCap1HChange'] as num?)?.toDouble(),
        slug: json['slug'] as String?,
        coinsCount: json['coinsCount'] as int?,
        data: json['data'] != null
            ? CategoryData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  // Converts Category to JSON format
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'marketCap1HChange': marketCap1HChange,
        'slug': slug,
        'coinsCount': coinsCount,
        'data': data?.toJson(),
      };
}

class CategoryData {
  double? marketCap;
  double? marketCapBtc;
  double? totalVolume;
  double? totalVolumeBtc;
  Map<String, double>? marketCapChangePercentage24H;
  String? sparkline;

  CategoryData({
    this.marketCap,
    this.marketCapBtc,
    this.totalVolume,
    this.totalVolumeBtc,
    this.marketCapChangePercentage24H,
    this.sparkline,
  });

  // Factory constructor for creating CategoryData from JSON
  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        marketCap: (json['marketCap'] as num?)?.toDouble(),
        marketCapBtc: (json['marketCapBtc'] as num?)?.toDouble(),
        totalVolume: (json['totalVolume'] as num?)?.toDouble(),
        totalVolumeBtc: (json['totalVolumeBtc'] as num?)?.toDouble(),
        marketCapChangePercentage24H:
            (json['marketCapChangePercentage24H'] != null)
                ? Map<String, double>.from(json['marketCapChangePercentage24H'])
                : null,
        sparkline: json['sparkline'] as String?,
      );

  // Converts CategoryData to JSON format
  Map<String, dynamic> toJson() => {
        'marketCap': marketCap,
        'marketCapBtc': marketCapBtc,
        'totalVolume': totalVolume,
        'totalVolumeBtc': totalVolumeBtc,
        'marketCapChangePercentage24H': marketCapChangePercentage24H,
        'sparkline': sparkline,
      };
}

class Nft {
  String? id;
  String? name;
  String? symbol;
  String? thumb;
  int? nftContractId;
  String? nativeCurrencySymbol;
  double? floorPriceInNativeCurrency;
  double? floorPrice24HPercentageChange;
  NftData? data;

  Nft({
    this.id,
    this.name,
    this.symbol,
    this.thumb,
    this.nftContractId,
    this.nativeCurrencySymbol,
    this.floorPriceInNativeCurrency,
    this.floorPrice24HPercentageChange,
    this.data,
  });

  // Factory constructor for creating Nft from JSON
  factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        id: json['id'] as String?,
        name: json['name'] as String?,
        symbol: json['symbol'] as String?,
        thumb: json['thumb'] as String?,
        nftContractId: json['nft_contract_id'] as int?,
        nativeCurrencySymbol: json['native_currency_symbol'] as String?,
        floorPriceInNativeCurrency:
            (json['floor_price_in_native_currency'] as num?)?.toDouble(),
        floorPrice24HPercentageChange:
            (json['floor_price_24h_percentage_change'] as num?)?.toDouble(),
        data: json['data'] != null
            ? NftData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  // Converts Nft to JSON format
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'symbol': symbol,
        'thumb': thumb,
        'nft_contract_id': nftContractId,
        'native_currency_symbol': nativeCurrencySymbol,
        'floor_price_in_native_currency': floorPriceInNativeCurrency,
        'floor_price_24h_percentage_change': floorPrice24HPercentageChange,
        'data': data?.toJson(),
      };
}

class NftData {
  String? floorPrice;
  String? floorPriceInUsd24HPercentageChange;
  String? h24Volume;
  String? h24AverageSalePrice;
  String? sparkline;
  dynamic content;

  NftData({
    this.floorPrice,
    this.floorPriceInUsd24HPercentageChange,
    this.h24Volume,
    this.h24AverageSalePrice,
    this.sparkline,
    this.content,
  });

  // Factory constructor for creating NftData from JSON
  factory NftData.fromJson(Map<String, dynamic> json) => NftData(
        floorPrice: json['floor_price'] as String?,
        floorPriceInUsd24HPercentageChange:
            json['floor_price_in_usd_24h_percentage_change'] as String?,
        h24Volume: json['h24_volume'] as String?,
        h24AverageSalePrice: json['h24_average_sale_price'] as String?,
        sparkline: json['sparkline'] as String?,
        content: json['content'],
      );

  // Converts NftData to JSON format
  Map<String, dynamic> toJson() => {
        'floor_price': floorPrice,
        'floor_price_in_usd_24h_percentage_change':
            floorPriceInUsd24HPercentageChange,
        'h24_volume': h24Volume,
        'h24_average_sale_price': h24AverageSalePrice,
        'sparkline': sparkline,
        'content': content,
      };
}
