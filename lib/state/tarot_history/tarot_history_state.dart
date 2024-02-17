import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/tarot_history.dart';

part 'tarot_history_state.freezed.dart';

@freezed
class TarotHistoryState with _$TarotHistoryState {
  const factory TarotHistoryState({
    required List<TarotHistory> record,
  }) = _TarotHistoryState;
}
