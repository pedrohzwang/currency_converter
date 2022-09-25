class Currency {
  Currency({
    required this.name,
    required this.buy,
    required this.sell,
    required this.variation,
    this.symbol,
  });

  String name;
  late String? symbol;
  double? buy;
  double? sell;
  double? variation;

  static Currency fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'],
      buy: json['buy'],
      sell: json['sell'],
      variation: json['variation'],
    );
  }
}
