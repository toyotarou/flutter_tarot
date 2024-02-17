// ignore_for_file: type_annotate_public_apis

import 'package:flutter/material.dart';

import '../layouts/_components/tarot_alert.dart';
import '../model/tarot_all.dart';

class Utility {
  /// 背景取得
  Widget getBackGround({context}) {
    return Image.asset(
      'assets/image/bg.jpg',
      fit: BoxFit.fitHeight,
      color: Colors.black.withOpacity(0.7),
      colorBlendMode: BlendMode.darken,
    );
  }

  void showTarotDialog(
      {required int id,
      required List<TarotAll> state,
      required BuildContext context}) {
    var data = TarotAll(
      id: 0,
      name: '',
      image: '',
      prof1: '',
      prof2: '',
      wordJ: '',
      wordR: '',
      msgJ: '',
      msgR: '',
      msg2J: '',
      msg2R: '',
      msg3J: '',
      msg3R: '',
      drawNum: '',
      drawNumJ: [],
      drawNumR: [],
    );

    for (var i = 0; i < state.length; i++) {
      if (state[i].id == id) {
        data = state[i];
        break;
      }
    }

    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          insetPadding: const EdgeInsets.all(30),
          child: TarotAlert(data: data),
        );
      },
    );
  }
}
