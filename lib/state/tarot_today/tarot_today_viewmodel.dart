// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../model/tarot_one.dart';
import 'tarot_today_state.dart';

final tarotTodayProvider =
    StateNotifierProvider.autoDispose.family<TarotTodayNotifier, TarotTodayState, String>((ref, today) {
  final client = ref.read(httpClientProvider);

  return TarotTodayNotifier(
    TarotTodayState(
      record: TarotOne(
        id: '',
        reverse: '',
        name: '',
        prof1: '',
        prof2: '',
        image: '',
        word: '',
        msg1: '',
        msg2: '',
        msg3: '',
      ),
    ),
    client,
  )..getTarotToday(today: today);
});

class TarotTodayNotifier extends StateNotifier<TarotTodayState> {
  TarotTodayNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getTarotToday({required String today}) async {
    await client.post(path: 'tarotcard', body: {'today': today}).then((value) {
      final stt = TarotOne(
        id: value['data']['id'].toString(),
        reverse: value['data']['just_reverse'].toString(),
        name: value['data']['name'].toString(),
        prof1: value['data']['prof1'].toString(),
        prof2: value['data']['prof2'].toString(),
        image: value['data']['image'].toString(),
        word: value['data']['word'].toString(),
        msg1: value['data']['msg'].toString(),
        msg2: value['data']['msg2'].toString(),
        msg3: value['data']['msg3'].toString(),
      );

      state = state.copyWith(record: stt);
    });
  }
}
