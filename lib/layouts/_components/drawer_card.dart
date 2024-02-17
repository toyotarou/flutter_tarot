// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/tarot_all.dart';
import '../../state/tarot_rate/tarot_rate_state.dart';
import '../../state/tarot_rate/tarot_rate_viewmodel.dart';
import 'tarot_alert.dart';

class DrawerCard extends ConsumerWidget {
  DrawerCard({super.key, required this.data, required this.category});

  final TarotAll data;
  final String category;

  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;

    var tarotRateState = const TarotRateState(record: []);
    switch (category) {
      case 'big':
        tarotRateState = ref.watch(tarotRateProvider('big'));
        break;
      case 'cups':
        tarotRateState = ref.watch(tarotRateProvider('cups'));
        break;
      case 'pentacles':
        tarotRateState = ref.watch(tarotRateProvider('pentacles'));
        break;
      case 'swords':
        tarotRateState = ref.watch(tarotRateProvider('swords'));
        break;
      case 'wands':
        tarotRateState = ref.watch(tarotRateProvider('wands'));
        break;
    }

    final image = 'http://toyohide.work/BrainLog/tarotcards/${data.image}.jpg';

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showTarotDialog(data: data);
      },
      child: Card(
        color: Colors.black.withOpacity(0.1),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: size.height / 6,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60,
                    child: Image.network(image),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data.name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Transform.rotate(
                              angle: -45 * pi / 180,
                              child: const Icon(
                                FontAwesomeIcons.caretRight,
                                color: Colors.yellowAccent,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(data.msgJ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            data.drawNumJ.length.toString(),
                            style: TextStyle(
                              color: (data.drawNumJ.isEmpty) ? Colors.yellowAccent : Colors.white,
                            ),
                          ),
                        ),
                        Text(data.msgR),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            data.drawNumR.length.toString(),
                            style: TextStyle(
                              color: (data.drawNumR.isEmpty) ? Colors.yellowAccent : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        getTarotRate(id: data.id, state: tarotRateState),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.yellowAccent.withOpacity(0.3),
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget getTarotRate({required int id, required TarotRateState state}) {
    var rate = '';

    for (var i = 0; i < state.record.length; i++) {
      if (state.record[i].id == id) {
        rate = state.record[i].rate;
        break;
      }
    }

    final exRate = rate.split(' / ');

    return Container(
      alignment: Alignment.topRight,
      child: Text(
        rate,
        style: TextStyle(color: (exRate[0] == '0') ? Colors.yellowAccent : Colors.white),
      ),
    );
  }

  ///
  void showTarotDialog({required TarotAll data}) {
    showDialog(
      context: _context,
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
