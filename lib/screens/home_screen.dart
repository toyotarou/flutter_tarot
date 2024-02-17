// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../model/tarot_all.dart';
import '../state/tarot_all/tarot_all_viewmodel.dart';
import '../state/tarot_today/tarot_today_viewmodel.dart';
import '../utility/utility.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  List<TarotAll> straightAll = [];

  final Utility _utility = Utility();

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarotStraightAllState = ref.watch(tarotStraightAllProvider);
    straightAll = tarotStraightAllState.record;

    final tarotTodayState = ref.watch(
      tarotTodayProvider(DateTime.now().toString().split(' ')[0]),
    );

    final qt = (tarotTodayState.record.reverse == 'just') ? 0 : 2;

    final image = (tarotTodayState.record.image == '')
        ? ''
        : 'http://toyohide.work/BrainLog/tarotcards/${tarotTodayState.record.image}.jpg';

    return DefaultLayout(
      title: 'Today\'s Tarot',
      isTitleDisplay: true,
      isDrawerDisplay: true,
      widget: DefaultTextStyle(
        style: const TextStyle(fontSize: 14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.withOpacity(0.3),
                  ),
                  child: Text(DateTime.now().toString().split(' ')[0]),
                ),
                IconButton(
                  onPressed: () {
                    _utility.showTarotDialog(
                      id: int.parse(tarotTodayState.record.id),
                      state: straightAll,
                      context: context,
                    );
                  },
                  icon: const Icon(Icons.info_outline),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              tarotTodayState.record.name,
              style: const TextStyle(fontSize: 30),
            ),
            if (image != '')
              RotatedBox(
                quarterTurns: qt,
                child: Image.network(image),
              ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(tarotTodayState.record.prof2),
            ),
            const Divider(color: Colors.indigo),
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.3)),
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                (tarotTodayState.record.reverse == 'just') ? '正位置' : '逆位置',
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                tarotTodayState.record.word,
                style: const TextStyle(color: Colors.yellowAccent),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text(tarotTodayState.record.msg1),
            ),
            Container(padding: const EdgeInsets.all(10), child: Text(tarotTodayState.record.msg2)),
            Container(padding: const EdgeInsets.all(10), child: Text(tarotTodayState.record.msg3)),
          ],
        ),
      ),
    );
  }
}
