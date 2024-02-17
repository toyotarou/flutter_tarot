class TarotOne {
  TarotOne({
    required this.id,
    required this.reverse,
    required this.name,
    required this.prof1,
    required this.prof2,
    required this.image,
    required this.word,
    required this.msg1,
    required this.msg2,
    required this.msg3,
  });

  factory TarotOne.fromJson(Map<String, dynamic> json) => TarotOne(
        id: json['id'].toString(),
        reverse: json['reverse'].toString(),
        name: json['name'].toString(),
        prof1: json['prof1'].toString(),
        prof2: json['prof2'].toString(),
        image: json['image'].toString(),
        word: json['word'].toString(),
        msg1: json['msg1'].toString(),
        msg2: json['msg2'].toString(),
        msg3: json['msg3'].toString(),
      );

  String id;
  String reverse;
  String name;
  String prof1;
  String prof2;
  String image;
  String word;
  String msg1;
  String msg2;
  String msg3;

  Map<String, dynamic> toJson() => {
        'id': id,
        'reverse': reverse,
        'name': name,
        'prof1': prof1,
        'prof2': prof2,
        'image': image,
        'word': word,
        'msg1': msg1,
        'msg2': msg2,
        'msg3': msg3,
      };
}
