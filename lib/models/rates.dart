
class Currency{
  final String name;
  final int unit;
  Currency({this.unit, this.name});

  factory Currency.fromJson(Map<String, dynamic> json){
    return Currency(
      name: json['name'],
      unit: json['unit']
    );
  }

}
class Rates{
Currency currency;
final String buy;
final String sell;

Rates({this.buy, this.sell, this.currency});
factory Rates.fromJson(Map<String, dynamic> json){
  return Rates(
   currency: json['currency'] !=null ? Currency.fromJson(json['currency']) : null,
    buy: json['buy'],
    sell: json['sell']
  );

}


}