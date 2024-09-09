import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarot/model/tarot_all.dart';

import '../../extensions/extensions.dart';
import '../../model/tarot_one.dart';
import '../../state/tarot_all/tarot_all_viewmodel.dart';
import '../../state/tarot_draw/tarot_draw_notifier.dart';
import '../../utility/utility.dart';

// ignore: must_be_immutable
class TarotCelticCrossAlert extends ConsumerWidget {
  TarotCelticCrossAlert({super.key});

  List<TarotOne> tarot10cards = [];

  List<String> explanationList = [
    '現在の状況|質問者が今どのような状況に置かれているかを示します。',
    '障害と対策（キーカード）|現状に対して対立するもの、乗り越えていくものを示します。正位置で解釈します。',
    '顕在している事柄・意識（可能性）|表に見えることで、これから問題に対してどうなるか、可能性を示します。',
    '潜在している事柄・意識|表には見えていない、現状に対して問題の根っこにあることを示します。',
    '近い過去|現状に対して影響を及ぼした過去のことを示します。',
    '近い未来|現状から近い未来で起こる可能性があることを示します。',
    '質問者の立場や状況|質問者が占う内容や問題に対してどんな関わり方をしているかを示します。',
    '質問者以外の人|質問者以外の人物の心理や状況などを示します。',
    '質問者の願望|理想や恐れなど質問者の問題に対しての態度を表します。',
    '最終結果|質問に対する最終的な結果を示します。他の9枚のカードと合わせて読み取ります。',
  ];

  final Utility _utility = Utility();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    makeTarot10Card();

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
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              Expanded(child: tarot10CardsDisplay()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  void makeTarot10Card() {
    tarot10cards = [];

    final tarotCardNames = <String>[];

    final cards = <TarotOne>[];

    _ref.watch(tarotDrawProvider(drawNum: 30)).when(
          data: (value) {
            value.record.forEach((element) {
              if (!tarotCardNames.contains(element.name)) {
                if (cards.length < 16) {
                  cards.add(element);
                }
              }
              tarotCardNames.add(element.name);

              //最初の6枚を捨てる
              for (var i = 6; i < cards.length; i++) {
                tarot10cards.add(cards[i]);
              }
            });
          },
          error: (e, s) => null,
          loading: () => null,
        );
  }

  ///
  Widget tarot10CardsDisplay() {
    final list = <Widget>[];

    final tarotStraightAllState = _ref.watch(tarotStraightAllProvider);

    final straightAll = (tarotStraightAllState.value != null)
        ? tarotStraightAllState.value!.record
        : <TarotAll>[];

    for (var i = 0; i < tarot10cards.length; i++) {
      final qt = (tarot10cards[i].reverse == 'just') ? 0 : 2;

      final image = (tarot10cards[i].image == '')
          ? ''
          : 'http://toyohide.work/BrainLog/tarotcards/${tarot10cards[i].image}.jpg';

      final exPlanation = explanationList[i].split('|');

      list.add(Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                child: (image != '')
                    ? RotatedBox(
                        quarterTurns: qt,
                        child: Image.network(image),
                      )
                    : Container(),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exPlanation[0],
                          style: const TextStyle(fontSize: 12)),
                      Text(exPlanation[1]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          GestureDetector(
                            onTap: () {
                              _utility.showTarotDialog(
                                  id: int.parse(tarot10cards[i].id),
                                  state: straightAll,
                                  context: _context);
                            },
                            child: Text(tarot10cards[i].name),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ));
    }

    return SingleChildScrollView(child: Column(children: list));
  }
}
