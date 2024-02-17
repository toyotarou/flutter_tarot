// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../model/tarot_rate.dart';
import 'tarot_rate_state.dart';

final tarotRateProvider =
    StateNotifierProvider.autoDispose.family<TarotRateNotifier, TarotRateState, String>((ref, category) {
  final client = ref.read(httpClientProvider);

  return TarotRateNotifier(
    const TarotRateState(record: []),
    client,
  )..getTarotRate(category: category);
});

class TarotRateNotifier extends StateNotifier<TarotRateState> {
  TarotRateNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getTarotRate({required String category}) async {
    await client.post(path: 'getCategoryRate', body: {'category': category}).then((value) {
      final list = <TarotRate>[];

      for (var i = 0; i < int.parse(value['data'].length.toString()); i++) {
        final oneData = value['data'][i];
        list.add(
          TarotRate(
            id: int.parse(oneData['id'].toString()),
            name: oneData['name'].toString(),
            rate: oneData['rate'].toString(),
          ),
        );
      }

      state = state.copyWith(record: list);
    });
  }
}
