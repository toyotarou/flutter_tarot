// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../state/tarot_history/tarot_history_notifier.dart';
import 'page/tarot_list_page.dart';

class TabInfo {
  TabInfo(this.label, this.widget);

  String label;
  Widget widget;
}

class TarotListAlert extends ConsumerWidget {
  TarotListAlert({super.key});

  List<TabInfo> tabs = [];

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    makeTab();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.transparent,
            //-------------------------//これを消すと「←」が出てくる（消さない）
            leading: const Icon(
              Icons.check_box_outline_blank,
              color: Colors.transparent,
            ),
            //-------------------------//これを消すと「←」が出てくる（消さない）

            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.blueAccent,
              tabs: tabs.map((TabInfo tab) {
                return Tab(text: tab.label);
              }).toList(),
            ),

            flexibleSpace: const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) => tab.widget).toList(),
        ),
      ),
    );
  }

  ///
  void makeTab() {
    final tarotHistoryState = _ref.watch(tarotHistoryProvider);

    final list = <String>[];
    tarotHistoryState.record.forEach((element) {
      final ym = '${element.year}-${element.month}-${element.day} 00:00:00'.toDateTime().yyyymm;

      if (!list.contains(ym)) {
        list.add(ym);
      }
    });

    list
      ..sort((a, b) => -1 * a.compareTo(b))
      ..forEach((element) {
        tabs.add(
          TabInfo(
            element,
            TarotListPage(date: '$element-01 00:00:00'.toDateTime()),
          ),
        );
      });
  }
}
