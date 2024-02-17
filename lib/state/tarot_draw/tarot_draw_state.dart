import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/tarot_one.dart';

part 'tarot_draw_state.freezed.dart';

@freezed
class TarotDrawState with _$TarotDrawState {
  const factory TarotDrawState({
    required List<TarotOne> record,
  }) = _TarotDrawState;
}
