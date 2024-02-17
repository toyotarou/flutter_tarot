import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/tarot_all.dart';

part 'tarot_straight_all_state.freezed.dart';

@freezed
class TarotStraightAllState with _$TarotStraightAllState {
  const factory TarotStraightAllState({
    required List<TarotAll> record,
  }) = _TarotStraightAllState;
}
