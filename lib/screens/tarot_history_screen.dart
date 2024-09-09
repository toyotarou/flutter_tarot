// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../layouts/_components/history_card.dart';
import '../layouts/default_layout.dart';
import '../model/tarot_all.dart';
import '../model/tarot_history.dart';
import '../state/tarot_all/tarot_all_viewmodel.dart';
import '../state/tarot_history/tarot_history_notifier.dart';

class TarotHistoryScreen extends ConsumerWidget {
  TarotHistoryScreen({super.key});

  final autoScrollController = AutoScrollController();

  List<Map<String, dynamic>> buttonList = [];

  List<TarotAll> straightAll = [];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarotHistoryState = ref.watch(tarotHistoryProvider);

    final tarotStraightAllState = ref.watch(tarotStraightAllProvider);
    straightAll = (tarotStraightAllState.value != null)
        ? tarotStraightAllState.value!.record
        : [];

    makeJumpButton(
        data: (tarotHistoryState.value != null)
            ? tarotHistoryState.value!.record
            : []);

    final size = MediaQuery.of(context).size;

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      isDrawerDisplay: false,
      widget: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('History', style: TextStyle(fontSize: 20)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
            child: SingleChildScrollView(
              child: Wrap(
                children: buttonList.map((val) {
                  return GestureDetector(
                    onTap: () {
                      autoScrollController.scrollToIndex(
                        int.parse(val['pos'].toString()),
                        preferPosition: AutoScrollPosition.begin,
                      );
                    },
                    child: Container(
                      width: size.width / 5,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green[900]!.withOpacity(0.8),
                      ),
                      child: Text(
                        val['ym'].toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.7 - 80,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              controller: autoScrollController,
              itemCount: (tarotHistoryState.value != null)
                  ? tarotHistoryState.value!.record.length
                  : 0,
              itemBuilder: (context, index) {
                if (tarotHistoryState.value != null) {
                  final history = tarotHistoryState.value!.record[index];

                  return AutoScrollTag(
                    key: ValueKey(index),
                    index: index,
                    controller: autoScrollController,
                    child: HistoryCard(history: history, usage: 'history'),
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  ///
  void makeJumpButton({required List<TarotHistory> data}) {
    var keepYm = '';
    for (var i = 0; i < data.length; i++) {
      if ('${data[i].year}-${data[i].month}' != keepYm) {
        final map = <String, dynamic>{};
        map['pos'] = i;
        map['ym'] = '${data[i].year}-${data[i].month}';
        buttonList.add(map);
      }

      keepYm = '${data[i].year}-${data[i].month}';
    }
  }
}
