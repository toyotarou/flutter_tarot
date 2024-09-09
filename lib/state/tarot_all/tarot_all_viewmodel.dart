// ignore_for_file: non_constant_identifier_names, avoid_dynamic_calls

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../model/tarot_all.dart';
import 'tarot_category_all_state.dart';
import 'tarot_straight_all_state.dart';

part 'tarot_all_viewmodel.g.dart';

////////////////////////////////////////////////////////////////

@riverpod
Future<TarotCategoryAllState> tarotCategoryAll(TarotCategoryAllRef ref) async {
  final client = ref.read(httpClientProvider);

  final map = <String, List<TarotAll>>{};

  await client.post(path: 'getAllTarot').then((value) {
    final kindList = ['big', 'cups', 'pentacles', 'swords', 'wands'];

    for (var j = 0; j < kindList.length; j++) {
      map[kindList[j]] = [];

      for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
        final oneData = value['data'][i];

        if (RegExp(kindList[j]).firstMatch(oneData['image'].toString()) !=
            null) {
          final list2 = <DateTime>[];
          for (var k = 0;
              k < int.parse(oneData['drawNum_j'].length.toString());
              k++) {
            list2.add(
              DateTime.parse(oneData['drawNum_j'][k].toString()),
            );
          }

          final list3 = <DateTime>[];
          for (var k = 0;
              k < int.parse(oneData['drawNum_r'].length.toString());
              k++) {
            list3.add(
              DateTime.parse(oneData['drawNum_r'][k].toString()),
            );
          }

          map[kindList[j]]!.add(
            TarotAll(
              id: int.parse(oneData['id'].toString()),
              name: oneData['name'].toString(),
              image: oneData['image'].toString(),
              prof1: oneData['prof1'].toString(),
              prof2: oneData['prof2'].toString(),
              wordJ: oneData['word_j'].toString(),
              wordR: oneData['word_r'].toString(),
              msgJ: oneData['msg_j'].toString(),
              msgR: oneData['msg_r'].toString(),
              msg2J: oneData['msg2_j'].toString(),
              msg2R: oneData['msg2_r'].toString(),
              msg3J: oneData['msg3_j'].toString(),
              msg3R: oneData['msg3_r'].toString(),
              drawNum: oneData['drawNum'].toString(),
              drawNumJ: list2,
              drawNumR: list3,
            ),
          );
        }
      }
    }
  });

  return TarotCategoryAllState(record: map);
}

/*

class tarotCategoryAll extends _$tarotCategoryAll {
  @override
  Future<TarotCategoryAllState> build() async {
    final client = ref.read(httpClientProvider);

    await client.post(path: 'getAllTarot').then((value) {});

    return TarotCategoryAllState(record: {});
  }
}

final tarotCategoryAllProvider =
    StateNotifierProvider.autoDispose<TarotCategoryAllNotifier, TarotCategoryAllState>((ref) {
  final client = ref.read(httpClientProvider);

  return TarotCategoryAllNotifier(
    const TarotCategoryAllState(record: {}),
    client,
  )..getCategoryAllTarot();
});

class TarotCategoryAllNotifier extends StateNotifier<TarotCategoryAllState> {
  TarotCategoryAllNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getCategoryAllTarot() async {
    await client.post(path: 'getAllTarot').then((value) {
      final kindList = ['big', 'cups', 'pentacles', 'swords', 'wands'];

      final map = <String, List<TarotAll>>{};

      for (var j = 0; j < kindList.length; j++) {
        map[kindList[j]] = [];

        for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
          final oneData = value['data'][i];

          if (RegExp(kindList[j]).firstMatch(oneData['image'].toString()) != null) {
            final list2 = <DateTime>[];
            for (var k = 0; k < int.parse(oneData['drawNum_j'].length.toString()); k++) {
              list2.add(
                DateTime.parse(oneData['drawNum_j'][k].toString()),
              );
            }

            final list3 = <DateTime>[];
            for (var k = 0; k < int.parse(oneData['drawNum_r'].length.toString()); k++) {
              list3.add(
                DateTime.parse(oneData['drawNum_r'][k].toString()),
              );
            }

            map[kindList[j]]!.add(
              TarotAll(
                id: int.parse(oneData['id'].toString()),
                name: oneData['name'].toString(),
                image: oneData['image'].toString(),
                prof1: oneData['prof1'].toString(),
                prof2: oneData['prof2'].toString(),
                wordJ: oneData['word_j'].toString(),
                wordR: oneData['word_r'].toString(),
                msgJ: oneData['msg_j'].toString(),
                msgR: oneData['msg_r'].toString(),
                msg2J: oneData['msg2_j'].toString(),
                msg2R: oneData['msg2_r'].toString(),
                msg3J: oneData['msg3_j'].toString(),
                msg3R: oneData['msg3_r'].toString(),
                drawNum: oneData['drawNum'].toString(),
                drawNumJ: list2,
                drawNumR: list3,
              ),
            );
          }
        }
      }

      state = state.copyWith(record: map);
    });
  }
}
*/
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////

@riverpod
Future<TarotStraightAllState> tarotStraightAll(TarotStraightAllRef ref) async {
  final client = ref.read(httpClientProvider);

  final list = <TarotAll>[];

  await client.post(path: 'getAllTarot').then((value) {
    final list = <TarotAll>[];
    for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
      final oneData = value['data'][i];

      final list2 = <DateTime>[];
      for (var k = 0;
          k < int.parse(oneData['drawNum_j'].length.toString());
          k++) {
        list2.add(
          DateTime.parse(oneData['drawNum_j'][k].toString()),
        );
      }

      final list3 = <DateTime>[];
      for (var k = 0;
          k < int.parse(oneData['drawNum_r'].length.toString());
          k++) {
        list3.add(
          DateTime.parse(oneData['drawNum_r'][k].toString()),
        );
      }

      list.add(
        TarotAll(
          id: int.parse(oneData['id'].toString()),
          name: oneData['name'].toString(),
          image: oneData['image'].toString(),
          prof1: oneData['prof1'].toString(),
          prof2: oneData['prof2'].toString(),
          wordJ: oneData['word_j'].toString(),
          wordR: oneData['word_r'].toString(),
          msgJ: oneData['msg_j'].toString(),
          msgR: oneData['msg_r'].toString(),
          msg2J: oneData['msg2_j'].toString(),
          msg2R: oneData['msg2_r'].toString(),
          msg3J: oneData['msg3_j'].toString(),
          msg3R: oneData['msg3_r'].toString(),
          drawNum: oneData['drawNum'].toString(),
          drawNumJ: list2,
          drawNumR: list3,
        ),
      );
    }
  });

  return TarotStraightAllState(record: list);
}

/*

final tarotStraightAllProvider = StateNotifierProvider.autoDispose<
    TarotStraightAllNotifier, TarotStraightAllState>((ref) {
  final client = ref.read(httpClientProvider);

  return TarotStraightAllNotifier(
    const TarotStraightAllState(record: []),
    client,
  )..getStraightAllTarot();
});

class TarotStraightAllNotifier extends StateNotifier<TarotStraightAllState> {
  TarotStraightAllNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getStraightAllTarot() async {
    await client.post(path: 'getAllTarot').then((value) {
      final list = <TarotAll>[];
      for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
        final oneData = value['data'][i];

        final list2 = <DateTime>[];
        for (var k = 0;
            k < int.parse(oneData['drawNum_j'].length.toString());
            k++) {
          list2.add(
            DateTime.parse(oneData['drawNum_j'][k].toString()),
          );
        }

        final list3 = <DateTime>[];
        for (var k = 0;
            k < int.parse(oneData['drawNum_r'].length.toString());
            k++) {
          list3.add(
            DateTime.parse(oneData['drawNum_r'][k].toString()),
          );
        }

        list.add(
          TarotAll(
            id: int.parse(oneData['id'].toString()),
            name: oneData['name'].toString(),
            image: oneData['image'].toString(),
            prof1: oneData['prof1'].toString(),
            prof2: oneData['prof2'].toString(),
            wordJ: oneData['word_j'].toString(),
            wordR: oneData['word_r'].toString(),
            msgJ: oneData['msg_j'].toString(),
            msgR: oneData['msg_r'].toString(),
            msg2J: oneData['msg2_j'].toString(),
            msg2R: oneData['msg2_r'].toString(),
            msg3J: oneData['msg3_j'].toString(),
            msg3R: oneData['msg3_r'].toString(),
            drawNum: oneData['drawNum'].toString(),
            drawNumJ: list2,
            drawNumR: list3,
          ),
        );
      }

      state = state.copyWith(record: list);
    });
  }
}

*/

////////////////////////////////////////////////////////////////
