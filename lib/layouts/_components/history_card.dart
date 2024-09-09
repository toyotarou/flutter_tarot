// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/tarot_all.dart';
import '../../model/tarot_history.dart';
import '../../state/tarot_all/tarot_all_viewmodel.dart';
import '../../utility/utility.dart';

class HistoryCard extends ConsumerWidget {
  HistoryCard({super.key, required this.history, required this.usage});

  final TarotHistory history;
  final String usage;

  final Utility _utility = Utility();

  List<TarotAll> straightAll = [];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarotStraightAllState = ref.watch(tarotStraightAllProvider);
    straightAll = (tarotStraightAllState.value != null)
        ? tarotStraightAllState.value!.record
        : [];

    final date = '${history.year}-${history.month}-${history.day}';

    final qt = (history.reverse == '0') ? 0 : 2;

    final reverse = (history.reverse == '0') ? 'just' : 'reverse';

    final image = (history.image == '')
        ? ''
        : 'http://toyohide.work/BrainLog/tarotcards/${history.image}.jpg';

    final drawNum = makeDrawNum(history: history, state: straightAll);

    final size = MediaQuery.of(context).size;

    return Card(
      color: Colors.black.withOpacity(0.1),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: size.height / 8,
        ),
        child: Row(
          children: [
            if (image != '')
              SizedBox(
                width: 50,
                child: RotatedBox(
                  quarterTurns: qt,
                  child: Image.network(image),
                ),
              ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: Text(
                          (usage == 'history') ? date : drawNum.toString()),
                    ),
                    Text(
                      history.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(reverse),
                    const SizedBox(height: 10),
                    Text(history.word),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    _utility.showTarotDialog(
                      id: int.parse(history.id.toString()),
                      state: straightAll,
                      context: context,
                    );
                  },
                  icon: const Icon(Icons.info_outline),
                ),
                Text(
                  history.id.toString(),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  int makeDrawNum(
      {required TarotHistory history, required List<TarotAll> state}) {
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
      if (state[i].id == history.id) {
        data = state[i];
        break;
      }
    }

    return (history.reverse == '0')
        ? data.drawNumJ.length
        : data.drawNumR.length;
  }
}
