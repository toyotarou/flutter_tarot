// ignore_for_file: avoid_dynamic_calls, inference_failure_on_untyped_parameter

class TarotAll {
  TarotAll({
    required this.id,
    required this.name,
    required this.image,
    required this.prof1,
    required this.prof2,
    required this.wordJ,
    required this.wordR,
    required this.msgJ,
    required this.msgR,
    required this.msg2J,
    required this.msg2R,
    required this.msg3J,
    required this.msg3R,
    required this.drawNum,
    required this.drawNumJ,
    required this.drawNumR,
  });

  factory TarotAll.fromJson(Map<String, dynamic> json) => TarotAll(
        id: int.parse(json['name'].toString()),
        name: json['name'].toString(),
        image: json['image'].toString(),
        prof1: json['prof1'].toString(),
        prof2: json['prof2'].toString(),
        wordJ: json['word_j'].toString(),
        wordR: json['word_r'].toString(),
        msgJ: json['msg_j'].toString(),
        msgR: json['msg_r'].toString(),
        msg2J: json['msg2_j'].toString(),
        msg2R: json['msg2_r'].toString(),
        msg3J: json['msg3_j'].toString(),
        msg3R: json['msg3_r'].toString(),
        drawNum: json['drawNum'].toString(),
        drawNumJ: List<DateTime>.from(
          json['drawNum_j'].map(
            (x) => DateTime.parse(x.toString()),
          ) as Iterable,
        ),
        drawNumR: List<DateTime>.from(
          json['drawNum_r'].map(
            (x) => DateTime.parse(x.toString()),
          ) as Iterable,
        ),
      );

  int id;
  String name;
  String image;
  String prof1;
  String prof2;
  String wordJ;
  String wordR;
  String msgJ;
  String msgR;
  String msg2J;
  String msg2R;
  String msg3J;
  String msg3R;
  String drawNum;
  List<DateTime> drawNumJ;
  List<DateTime> drawNumR;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'prof1': prof1,
        'prof2': prof2,
        'word_j': wordJ,
        'word_r': wordR,
        'msg_j': msgJ,
        'msg_r': msgR,
        'msg2_j': msg2J,
        'msg2_r': msg2R,
        'msg3_j': msg3J,
        'msg3_r': msg3R,
        'drawNum': drawNum,
        'drawNum_j': List<dynamic>.from(
          drawNumJ.map(
            (x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}",
          ),
        ),
        'drawNum_r': List<dynamic>.from(
          drawNumR.map(
            (x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}",
          ),
        ),
      };
}
