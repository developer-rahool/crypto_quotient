// To parse this JSON data, do
//
//     final trendingModel = trendingModelFromJson(jsonString);

import 'dart:convert';

TrendingModel trendingModelFromJson(String str) =>
    TrendingModel.fromJson(json.decode(str));

String trendingModelToJson(TrendingModel data) => json.encode(data.toJson());

class TrendingModel {
  List<CoinItem>? coins;
  List<Nft>? nfts;
  List<Category>? categories;

  TrendingModel({
    this.coins,
    this.nfts,
    this.categories,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
        coins: json["coins"] == null
            ? []
            : List<CoinItem>.from(
                json["coins"]!.map((x) => CoinItem.fromJson(x))),
        nfts: json["nfts"] == null
            ? []
            : List<Nft>.from(json["nfts"]!.map((x) => Nft.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coins": coins == null
            ? []
            : List<dynamic>.from(coins!.map((x) => x.toJson())),
        "nfts": nfts == null
            ? []
            : List<dynamic>.from(nfts!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? name;
  double? marketCap1HChange;
  String? slug;
  String? coinsCount;
  CategoryData? data;

  Category({
    this.id,
    this.name,
    this.marketCap1HChange,
    this.slug,
    this.coinsCount,
    this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        marketCap1HChange: json["market_cap_1h_change"]?.toDouble(),
        slug: json["slug"],
        coinsCount: json["coins_count"],
        data: json["data"] == null ? null : CategoryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "market_cap_1h_change": marketCap1HChange,
        "slug": slug,
        "coins_count": coinsCount,
        "data": data?.toJson(),
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

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        marketCap: json["market_cap"]?.toDouble(),
        marketCapBtc: json["market_cap_btc"]?.toDouble(),
        totalVolume: json["total_volume"]?.toDouble(),
        totalVolumeBtc: json["total_volume_btc"]?.toDouble(),
        marketCapChangePercentage24H:
            Map.from(json["market_cap_change_percentage_24h"]!)
                .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        sparkline: json["sparkline"],
      );

  Map<String, dynamic> toJson() => {
        "market_cap": marketCap,
        "market_cap_btc": marketCapBtc,
        "total_volume": totalVolume,
        "total_volume_btc": totalVolumeBtc,
        "market_cap_change_percentage_24h":
            Map.from(marketCapChangePercentage24H!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "sparkline": sparkline,
      };
}

class CoinItem {
  Item? item;

  CoinItem({
    this.item,
  });

  factory CoinItem.fromJson(Map<String, dynamic> json) => CoinItem(
        item: json["item"] == null ? null : Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "item": item?.toJson(),
      };
}

class Item {
  String? id;
  int? coinId;
  String? name;
  String? symbol;
  int? marketCapRank;
  String? thumb;
  String? small;
  String? large;
  String? slug;
  double? priceBtc;
  int? score;
  ItemData? data;

  Item({
    this.id,
    this.coinId,
    this.name,
    this.symbol,
    this.marketCapRank,
    this.thumb,
    this.small,
    this.large,
    this.slug,
    this.priceBtc,
    this.score,
    this.data,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        coinId: json["coin_id"],
        name: json["name"],
        symbol: json["symbol"],
        marketCapRank: json["market_cap_rank"],
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
        slug: json["slug"],
        priceBtc: json["price_btc"]?.toDouble(),
        score: json["score"],
        data: json["data"] == null ? null : ItemData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coin_id": coinId,
        "name": name,
        "symbol": symbol,
        "market_cap_rank": marketCapRank,
        "thumb": thumb,
        "small": small,
        "large": large,
        "slug": slug,
        "price_btc": priceBtc,
        "score": score,
        "data": data?.toJson(),
      };
}

class ItemData {
  double? price;
  String? priceBtc;
  Map<String, double>? priceChangePercentage24H;
  String? marketCap;
  String? marketCapBtc;
  String? totalVolume;
  String? totalVolumeBtc;
  String? sparkline;
  Content? content;

  ItemData({
    this.price,
    this.priceBtc,
    this.priceChangePercentage24H,
    this.marketCap,
    this.marketCapBtc,
    this.totalVolume,
    this.totalVolumeBtc,
    this.sparkline,
    this.content,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        price: json["price"]?.toDouble(),
        priceBtc: json["price_btc"],
        priceChangePercentage24H: Map.from(json["price_change_percentage_24h"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        marketCap: json["market_cap"],
        marketCapBtc: json["market_cap_btc"],
        totalVolume: json["total_volume"],
        totalVolumeBtc: json["total_volume_btc"],
        sparkline: json["sparkline"],
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "price_btc": priceBtc,
        "price_change_percentage_24h": Map.from(priceChangePercentage24H!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap": marketCap,
        "market_cap_btc": marketCapBtc,
        "total_volume": totalVolume,
        "total_volume_btc": totalVolumeBtc,
        "sparkline": sparkline,
        "content": content?.toJson(),
      };
}

class Content {
  String? title;
  String? description;

  Content({
    this.title,
    this.description,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
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

  factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        thumb: json["thumb"],
        nftContractId: json["nft_contract_id"],
        nativeCurrencySymbol: json["native_currency_symbol"],
        floorPriceInNativeCurrency:
            json["floor_price_in_native_currency"]?.toDouble(),
        floorPrice24HPercentageChange:
            json["floor_price_24h_percentage_change"]?.toDouble(),
        data: json["data"] == null ? null : NftData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "thumb": thumb,
        "nft_contract_id": nftContractId,
        "native_currency_symbol": nativeCurrencySymbol,
        "floor_price_in_native_currency": floorPriceInNativeCurrency,
        "floor_price_24h_percentage_change": floorPrice24HPercentageChange,
        "data": data?.toJson(),
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

  factory NftData.fromJson(Map<String, dynamic> json) => NftData(
        floorPrice: json["floor_price"],
        floorPriceInUsd24HPercentageChange:
            json["floor_price_in_usd_24h_percentage_change"],
        h24Volume: json["h24_volume"],
        h24AverageSalePrice: json["h24_average_sale_price"],
        sparkline: json["sparkline"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "floor_price": floorPrice,
        "floor_price_in_usd_24h_percentage_change":
            floorPriceInUsd24HPercentageChange,
        "h24_volume": h24Volume,
        "h24_average_sale_price": h24AverageSalePrice,
        "sparkline": sparkline,
        "content": content,
      };
}
