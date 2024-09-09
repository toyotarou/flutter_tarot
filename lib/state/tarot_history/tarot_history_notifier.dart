// ignore_for_file: avoid_dynamic_calls

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../model/tarot_history.dart';
import 'tarot_history_state.dart';

part 'tarot_history_notifier.g.dart';

@riverpod
Future<TarotHistoryState> tarotHistory(TarotHistoryRef ref) async {
  final list = <TarotHistory>[];

  final client = ref.read(httpClientProvider);

  await client.post(path: 'tarothistory').then((value) {
    for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
      final oneData = value['data'][i];

      list.add(TarotHistory.fromJson(oneData as Map<String, dynamic>));
    }
  });

  return TarotHistoryState(record: list);
}

/*

final tarotHistoryProvider = StateNotifierProvider.autoDispose<TarotHistoryNotifier, TarotHistoryState>((ref) {
  final client = ref.read(httpClientProvider);

  return TarotHistoryNotifier(const TarotHistoryState(record: []), client)..getTarotHistory();
});

class TarotHistoryNotifier extends StateNotifier<TarotHistoryState> {
  TarotHistoryNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getTarotHistory() async {
    await client.post(path: 'tarothistory').then((value) {
      final list = <TarotHistory>[];
      for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
        final oneData = value['data'][i];

        list.add(TarotHistory.fromJson(oneData as Map<String, dynamic>));
      }

      state = state.copyWith(record: list);
    });
  }
}

*/
