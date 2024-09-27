class CoinList {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  int marketCap;
  int marketCapRank;
  double high24H;
  double low24H;
  int totalVolume;
  double priceChangePercentage24H;
  double ath; // All Time High
  double atl; // All Time Low
  double circulatingSupply;
  double totalSupply;
  double maxSupply;

  CoinList({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24H,
    required this.low24H,
    required this.totalVolume,
    required this.priceChangePercentage24H,
    required this.ath,
    required this.atl,
    required this.circulatingSupply,
    required this.totalSupply,
    this.maxSupply = 0.0, // Optional, can be null or 0.0
  });

  factory CoinList.fromJson(Map<String, dynamic> json) {
    return CoinList(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'].toDouble(),
      marketCap: json['market_cap'],
      marketCapRank: json['market_cap_rank'],
      high24H: json['high_24h'].toDouble(),
      low24H: json['low_24h'].toDouble(),
      totalVolume: json['total_volume'],
      priceChangePercentage24H: json['price_change_percentage_24h'].toDouble(),
      ath: json['ath'].toDouble(), // All Time High
      atl: json['atl'].toDouble(), // All Time Low
      circulatingSupply: json['circulating_supply'].toDouble(),
      totalSupply: json['total_supply'].toDouble(),
      maxSupply:
          json['max_supply'] != null ? json['max_supply'].toDouble() : 0.0,
    );
  }
}
