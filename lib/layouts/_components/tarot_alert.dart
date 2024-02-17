// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/tarot_all.dart';
import '../../state/tarot_rate/tarot_rate_state.dart';
import '../../state/tarot_rate/tarot_rate_viewmodel.dart';

class TarotAlert extends ConsumerWidget {
  TarotAlert({super.key, required this.data});

  final TarotAll data;

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    final image = (data.image == '') ? '' : 'http://toyohide.work/BrainLog/tarotcards/${data.image}.jpg';

    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.withOpacity(0.3),
                      ),
                      child: Text(data.id.toString()),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent.withOpacity(0.3),
                      ),
                      child: getTarotRate(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  data.name,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 10),
                Image.network(image),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(data.prof1),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(data.prof2),
                ),
                const Divider(color: Colors.indigo),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('正位置'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    data.wordJ,
                    style: const TextStyle(color: Colors.yellowAccent),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text(data.msgJ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.msg2J),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.msg3J),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data.drawNumJ.map((val) {
                        return Text(val.toString().split(' ')[0]);
                      }).toList(),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text('逆位置'),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    data.wordR,
                    style: const TextStyle(color: Colors.yellowAccent),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text(data.msgR),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.msg2R),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(data.msg3R),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data.drawNumR.map((val) {
                        return Text(val.toString().split(' ')[0]);
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget getTarotRate() {
    final kindList = ['big', 'cups', 'pentacles', 'swords', 'wands'];

    var tarotRateState = const TarotRateState(record: []);
    for (var j = 0; j < kindList.length; j++) {
      if (RegExp(kindList[j]).firstMatch(data.image) != null) {
        tarotRateState = _ref.watch(tarotRateProvider(kindList[j]));
        break;
      }
    }

    var rate = '';
    for (var i = 0; i < tarotRateState.record.length; i++) {
      if (tarotRateState.record[i].id == data.id) {
        rate = tarotRateState.record[i].rate;
        break;
      }
    }

    return Text(rate);
  }
}
