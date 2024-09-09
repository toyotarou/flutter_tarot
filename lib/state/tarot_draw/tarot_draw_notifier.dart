import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../model/tarot_one.dart';
import 'tarot_draw_state.dart';

part 'tarot_draw_notifier.g.dart';

@riverpod
Future<TarotDrawState> tarotDraw(TarotDrawRef ref,
    {required int drawNum}) async {
  final list = <TarotOne>[];

  final client = ref.read(httpClientProvider);

  await client
      .post(path: 'tarotthree', body: {'number': drawNum}).then((value) {
    // ignore: avoid_dynamic_calls
    for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
      // ignore: avoid_dynamic_calls
      final val = TarotOne.fromJson(value['data'][i] as Map<String, dynamic>);
      list.add(val);
    }
  });

  return TarotDrawState(record: list);
}

/*

final tarotDrawProvider =
    StateNotifierProvider.autoDispose.family<TarotDrawNotifier, TarotDrawState, int>((ref, drawNum) {
  final client = ref.read(httpClientProvider);

  return TarotDrawNotifier(const TarotDrawState(record: []), client)..getTarotDraw(drawNum: drawNum);
});

class TarotDrawNotifier extends StateNotifier<TarotDrawState> {
  TarotDrawNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getTarotDraw({required int drawNum}) async {
    await client.post(path: 'tarotthree', body: {'number': drawNum}).then((value) {
      final list = <TarotOne>[];

      // ignore: avoid_dynamic_calls
      for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
        // ignore: avoid_dynamic_calls
        final val = TarotOne.fromJson(value['data'][i] as Map<String, dynamic>);
        list.add(val);
      }

      state = state.copyWith(record: list);
    });
  }
}

*/
