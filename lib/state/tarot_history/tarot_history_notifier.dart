// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../model/tarot_history.dart';
import 'tarot_history_state.dart';

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
