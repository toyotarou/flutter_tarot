// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/_components/history_card.dart';
import '../layouts/default_layout.dart';
import '../model/tarot_history.dart';
import '../state/tarot_history/tarot_history_notifier.dart';

class TarotRankingScreen extends ConsumerWidget {
  TarotRankingScreen({super.key});

  List<TarotHistory> rankingList = [];

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    makeRankingList();

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
              const Text('Ranking', style: TextStyle(fontSize: 20)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.9,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final history = rankingList[index];

                return HistoryCard(history: history, usage: 'ranking');
              },
              separatorBuilder: (context, index) => Container(),
              itemCount: rankingList.length,
            ),
          ),
        ],
      ),
    );
  }

  ///
  void makeRankingList() {
    final tarotHistoryState = _ref.watch(tarotHistoryProvider);

    final map = <String, List<String>>{};
    final map3 = <String, TarotHistory>{};

    //初期化
    for (var i = 0; i < tarotHistoryState.record.length; i++) {
      final history = tarotHistoryState.record[i];

      final key = '${history.name}|${history.reverse}';

      map[key] = [];

      map3[key] = history;
    }

    for (var i = 0; i < tarotHistoryState.record.length; i++) {
      final history = tarotHistoryState.record[i];

      final key = '${history.name}|${history.reverse}';

      final date = '${history.year}-${history.month}-${history.day}';

      map[key]?.add(date);
    }

    final list = <int>[];

    final map2 = <String, int>{};
    map.forEach((key, value) {
      map2[key] = value.length;

      if (!list.contains(value.length)) {
        list.add(value.length);
      }
    });

    if (list.isNotEmpty) {
      final maxValue = list.reduce(max);

      for (var i = maxValue; i > 0; i--) {
        map2.forEach((key, value) {
          if (i == value) {
            rankingList.add(map3[key]!);
          }
        });
      }
    }
  }
}
