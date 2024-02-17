import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/tarot_all.dart';

part 'tarot_category_all_state.freezed.dart';

@freezed
class TarotCategoryAllState with _$TarotCategoryAllState {
  const factory TarotCategoryAllState({
    required Map<String, List<TarotAll>> record,
  }) = _TarotCategoryAllState;
}
