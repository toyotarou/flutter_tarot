import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarot/extensions/extensions.dart';
import 'package:tarot/model/tarot_all.dart';
import 'package:tarot/model/tarot_history.dart';
import 'package:tarot/state/tarot_all/tarot_all_viewmodel.dart';
import 'package:tarot/state/tarot_history/tarot_history_notifier.dart';
import 'package:tarot/utility/utility.dart';

class TarotListPage extends ConsumerStatefulWidget {
  const TarotListPage({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<TarotListPage> createState() => _TarotListPageState();
}

class _TarotListPageState extends ConsumerState<TarotListPage> {
  final Utility _utility = Utility();

  DateTime monthFirst = DateTime.now();

  List<String> youbiList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  List<String> days = [];

  Map<String, TarotHistory> tarotHistoryMap = {};

  Map<int, TarotAll> tarotAllMap = {};

  TransformationController transformationController =
      TransformationController();

  ///
  @override
  void dispose() {
    super.dispose();

    transformationController.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    getTarotHistoryMap();

    getTarotAllMap();

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: context.screenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: context.screenSize.width),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                setState(
                  () => transformationController.value = Matrix4.identity(),
                );
              },
              icon: const Icon(Icons.close),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: InteractiveViewer(
                transformationController: transformationController,
                minScale: 0.5,
                maxScale: 3,
                onInteractionUpdate: (details) => setState(() {}),
                child: _getCalendar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget _getCalendar() {
    monthFirst = DateTime(widget.date.year, widget.date.month);

    final monthEnd = DateTime(widget.date.year, widget.date.month + 1, 0);

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

    return SingleChildScrollView(
      child: DefaultTextStyle(
          style: const TextStyle(fontSize: 10), child: Column(children: list)),
    );
  }

  ///
  Widget getRow({required int week}) {
    final list = <Widget>[];

    for (var i = week * 7; i < ((week + 1) * 7); i++) {
      final dispDate = (days[i] == '')
          ? ''
          : DateTime(monthFirst.year, monthFirst.month, days[i].toInt())
              .yyyymmdd;

      list.add(
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: (days[i] == '')
                    ? Colors.transparent
                    : Colors.white.withOpacity(0.4),
              ),
            ),
            child: (days[i] == '')
                ? const Text('')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (tarotHistoryMap[dispDate] != null) ...[
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
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
                                constraints:
                                    const BoxConstraints(minHeight: 70),
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

    if (ref.watch(tarotHistoryProvider).value != null) {
      ref.watch(tarotHistoryProvider).value!.record.forEach((element) {
        tarotHistoryMap[
            '${element.year}-${element.month}-${element.day} 00:00:00'
                .toDateTime()
                .yyyymmdd] = element;
      });
    }
  }

  ///
  void getTarotAllMap() {
    tarotAllMap = {};

    ref.watch(tarotCategoryAllProvider).when(
          data: (value) => value.record.forEach((key, value2) =>
              value2.forEach((element) => tarotAllMap[element.id] = element)),
          error: (e, s) => null,
          loading: () => null,
        );
  }

  ///
  Widget _getImage({required int id, required String reverse}) {
    final tarot = tarotAllMap[id];

    if (tarot != null) {
      final image =
          'http://toyohide.work/BrainLog/tarotcards/${tarot.image}.jpg';

      final qt = (reverse == '0') ? 0 : 2;

      final tarotStraightAllState = ref.watch(tarotStraightAllProvider);

      return GestureDetector(
        onTap: () {
          _utility.showTarotDialog(
            id: id,
            state: (tarotStraightAllState.value != null)
                ? tarotStraightAllState.value!.record
                : [],
            context: context,
          );
        },
        child: SizedBox(
          width: 40,
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
