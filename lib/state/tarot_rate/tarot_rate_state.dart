import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/tarot_rate.dart';

part 'tarot_rate_state.freezed.dart';

@freezed
class TarotRateState with _$TarotRateState {
  const factory TarotRateState({
    required List<TarotRate> record,
  }) = _TarotRateState;
}
