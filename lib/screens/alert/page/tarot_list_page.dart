// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../extensions/extensions.dart';
import '../../../model/tarot_all.dart';
import '../../../model/tarot_history.dart';
import '../../../state/tarot_all/tarot_all_viewmodel.dart';
import '../../../state/tarot_history/tarot_history_notifier.dart';
import '../../../utility/utility.dart';

class TarotListPage extends ConsumerWidget {
  TarotListPage({super.key, required this.date});

  final DateTime date;

  final Utility _utility = Utility();

  DateTime monthFirst = DateTime.now();

  List<String> youbiList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  List<String> days = [];

  Map<String, TarotHistory> tarotHistoryMap = {};

  Map<int, TarotAll> tarotAllMap = {};

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    getTarotHistoryMap();

    getTarotAllMap();

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: context.screenSize.width),
              const SizedBox(height: 10),
              _getCalendar(),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _getCalendar() {
    monthFirst = DateTime(date.year, date.month);

    final monthEnd = DateTime(date.year, date.month + 1, 0);

    final diff = monthEnd.difference(monthFirst).inDays;
    final monthDaysNum = diff + 1;

    final youbi = monthFirst.youbiStr;
    final youbiNum = youbiList.indexWhere((element) => element == youbi);

    final weekNum = ((monthDaysNum + youbiNum) <= 35) ? 5 : 6;

    days = List.generate(weekNum * 7, (index) => '');

    for (var i = 0; i < (weekNum * 7); i++) {
      if (i >= youbiNum) {
        final gendate = monthFirst.add(Duration(days: i - youbiNum));

        if (monthFirst.month == gendate.month) {
          days[i] = gendate.day.toString();
        }
      }
    }

    final list = <Widget>[];
    for (var i = 0; i < weekNum; i++) {
      list.add(getRow(week: i));
    }

    return DefaultTextStyle(
      style: const TextStyle(fontSize: 7),
      child: Column(children: list),
    );
  }

  ///
  Widget getRow({required int week}) {
    final list = <Widget>[];

    for (var i = week * 7; i < ((week + 1) * 7); i++) {
      final dispDate = (days[i] == '') ? '' : DateTime(monthFirst.year, monthFirst.month, days[i].toInt()).yyyymmdd;

      list.add(
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: (days[i] == '') ? Colors.transparent : Colors.white.withOpacity(0.4),
              ),
            ),
            child: (days[i] == '')
                ? const Text('')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (tarotHistoryMap[dispDate] != null) ...[
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: (tarotHistoryMap[dispDate]!.reverse == '0')
                                ? Colors.blueAccent.withOpacity(0.3)
                                : Colors.redAccent.withOpacity(0.3),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(days[i].padLeft(2, '0')),
                              const SizedBox(height: 5),
                              _getImage(
                                id: tarotHistoryMap[dispDate]!.id,
                                reverse: tarotHistoryMap[dispDate]!.reverse,
                              ),
                              const SizedBox(height: 5),
                              ConstrainedBox(
                                constraints: const BoxConstraints(minHeight: 30),
                                child: Text(tarotHistoryMap[dispDate]!.name),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (tarotHistoryMap[dispDate] == null) ...[
                        Text(days[i].padLeft(2, '0')),
                        const SizedBox(height: 5),
                      ],
                    ],
                  ),
          ),
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  ///
  void getTarotHistoryMap() {
    tarotHistoryMap = {};

    _ref.watch(tarotHistoryProvider).record.forEach((element) {
      tarotHistoryMap['${element.year}-${element.month}-${element.day} 00:00:00'.toDateTime().yyyymmdd] = element;
    });
  }

  ///
  void getTarotAllMap() {
    tarotAllMap = {};

    final tarotCategoryAllState = _ref.watch(tarotCategoryAllProvider);

    tarotCategoryAllState.record.forEach((key, value) {
      value.forEach((element) {
        tarotAllMap[element.id] = element;
      });
    });
  }

  ///
  Widget _getImage({required int id, required String reverse}) {
    final tarot = tarotAllMap[id];

    if (tarot != null) {
      final image = 'http://toyohide.work/BrainLog/tarotcards/${tarot.image}.jpg';

      final qt = (reverse == '0') ? 0 : 2;

      final tarotStraightAllState = _ref.watch(tarotStraightAllProvider);

      return GestureDetector(
        onTap: () {
          _utility.showTarotDialog(
            id: id,
            state: tarotStraightAllState.record,
            context: _context,
          );
        },
        child: SizedBox(
          width: 50,
          child: RotatedBox(
            quarterTurns: qt,
            child: Image.network(image),
          ),
        ),
      );
    }

    return Container();
  }
}
