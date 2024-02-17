class TarotHistory {
  TarotHistory({
    required this.year,
    required this.month,
    required this.day,
    required this.id,
    required this.name,
    required this.image,
    required this.reverse,
    required this.word,
  });

  factory TarotHistory.fromJson(Map<String, dynamic> json) => TarotHistory(
        year: json['year'].toString(),
        month: json['month'].toString(),
        day: json['day'].toString(),
        id: int.parse(json['id'].toString()),
        name: json['name'].toString(),
        image: json['image'].toString(),
        reverse: json['reverse'].toString(),
        word: json['word'].toString(),
      );

  String year;
  String month;
  String day;
  int id;
  String name;
  String image;
  String reverse;
  String word;

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'day': day,
        'id': id,
        'name': name,
        'image': image,
        'reverse': reverse,
        'word': word,
      };
}
