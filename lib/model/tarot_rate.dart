class TarotRate {
  TarotRate({required this.id, required this.name, required this.rate});

  factory TarotRate.fromJson(Map<String, dynamic> json) => TarotRate(
        id: int.parse(json['id'].toString()),
        name: json['name'].toString(),
        rate: json['rate'].toString(),
      );

  int id;
  String name;
  String rate;

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'rate': rate};
}
