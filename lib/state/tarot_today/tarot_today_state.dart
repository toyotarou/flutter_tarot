import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/tarot_one.dart';

part 'tarot_today_state.freezed.dart';

@freezed
class TarotTodayState with _$TarotTodayState {
  const factory TarotTodayState({
    required TarotOne record,
  }) = _TarotTodayState;
}
