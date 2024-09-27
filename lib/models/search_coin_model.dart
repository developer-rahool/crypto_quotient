// To parse this JSON data, do
//
//     final coinSearchModel = coinSearchModelFromJson(jsonString);

import 'dart:convert';

CoinSearchModel coinSearchModelFromJson(String str) =>
    CoinSearchModel.fromJson(json.decode(str));

String coinSearchModelToJson(CoinSearchModel data) =>
    json.encode(data.toJson());

class CoinSearchModel {
  List<Coin>? coins;
  List<Exchange>? exchanges;
  List<dynamic>? icos;
  List<Category>? categories;
  List<Nft>? nfts;

  CoinSearchModel({
    this.coins,
    this.exchanges,
    this.icos,
    this.categories,
    this.nfts,
  });

  CoinSearchModel copyWith({
    List<Coin>? coins,
    List<Exchange>? exchanges,
    List<dynamic>? icos,
    List<Category>? categories,
    List<Nft>? nfts,
  }) =>
      CoinSearchModel(
        coins: coins ?? this.coins,
        exchanges: exchanges ?? this.exchanges,
        icos: icos ?? this.icos,
        categories: categories ?? this.categories,
        nfts: nfts ?? this.nfts,
      );

  factory CoinSearchModel.fromJson(Map<String, dynamic> json) =>
      CoinSearchModel(
        coins: json["coins"] == null
            ? []
            : List<Coin>.from(json["coins"]!.map((x) => Coin.fromJson(x))),
        exchanges: json["exchanges"] == null
            ? []
            : List<Exchange>.from(
                json["exchanges"]!.map((x) => Exchange.fromJson(x))),
        icos: json["icos"] == null
            ? []
            : List<dynamic>.from(json["icos"]!.map((x) => x)),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        nfts: json["nfts"] == null
            ? []
            : List<Nft>.from(json["nfts"]!.map((x) => Nft.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coins": coins == null
            ? []
            : List<dynamic>.from(coins!.map((x) => x.toJson())),
        "exchanges": exchanges == null
            ? []
            : List<dynamic>.from(exchanges!.map((x) => x.toJson())),
        "icos": icos == null ? [] : List<dynamic>.from(icos!.map((x) => x)),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "nfts": nfts == null
            ? []
            : List<dynamic>.from(nfts!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  Category copyWith({
    int? id,
    String? name,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Coin {
  String? id;
  String? name;
  String? apiSymbol;
  String? symbol;
  int? marketCapRank;
  String? thumb;
  String? large;

  Coin({
    this.id,
    this.name,
    this.apiSymbol,
    this.symbol,
    this.marketCapRank,
    this.thumb,
    this.large,
  });

  Coin copyWith({
    String? id,
    String? name,
    String? apiSymbol,
    String? symbol,
    int? marketCapRank,
    String? thumb,
    String? large,
  }) =>
      Coin(
        id: id ?? this.id,
        name: name ?? this.name,
        apiSymbol: apiSymbol ?? this.apiSymbol,
        symbol: symbol ?? this.symbol,
        marketCapRank: marketCapRank ?? this.marketCapRank,
        thumb: thumb ?? this.thumb,
        large: large ?? this.large,
      );

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        name: json["name"],
        apiSymbol: json["api_symbol"],
        symbol: json["symbol"],
        marketCapRank: json["market_cap_rank"],
        thumb: json["thumb"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "api_symbol": apiSymbol,
        "symbol": symbol,
        "market_cap_rank": marketCapRank,
        "thumb": thumb,
        "large": large,
      };
}

class Exchange {
  String? id;
  String? name;
  String? marketType;
  String? thumb;
  String? large;

  Exchange({
    this.id,
    this.name,
    this.marketType,
    this.thumb,
    this.large,
  });

  Exchange copyWith({
    String? id,
    String? name,
    String? marketType,
    String? thumb,
    String? large,
  }) =>
      Exchange(
        id: id ?? this.id,
        name: name ?? this.name,
        marketType: marketType ?? this.marketType,
        thumb: thumb ?? this.thumb,
        large: large ?? this.large,
      );

  factory Exchange.fromJson(Map<String, dynamic> json) => Exchange(
        id: json["id"],
        name: json["name"],
        marketType: json["market_type"],
        thumb: json["thumb"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "market_type": marketType,
        "thumb": thumb,
        "large": large,
      };
}

class Nft {
  String? id;
  String? name;
  String? symbol;
  String? thumb;

  Nft({
    this.id,
    this.name,
    this.symbol,
    this.thumb,
  });

  Nft copyWith({
    String? id,
    String? name,
    String? symbol,
    String? thumb,
  }) =>
      Nft(
        id: id ?? this.id,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        thumb: thumb ?? this.thumb,
      );

  factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "thumb": thumb,
      };
}
