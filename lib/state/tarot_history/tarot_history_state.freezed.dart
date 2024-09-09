// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TarotHistoryState {
  List<TarotHistory> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotHistoryStateCopyWith<TarotHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotHistoryStateCopyWith<$Res> {
  factory $TarotHistoryStateCopyWith(
          TarotHistoryState value, $Res Function(TarotHistoryState) then) =
      _$TarotHistoryStateCopyWithImpl<$Res, TarotHistoryState>;
  @useResult
  $Res call({List<TarotHistory> record});
}

/// @nodoc
class _$TarotHistoryStateCopyWithImpl<$Res, $Val extends TarotHistoryState>
    implements $TarotHistoryStateCopyWith<$Res> {
  _$TarotHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_value.copyWith(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as List<TarotHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarotHistoryStateImplCopyWith<$Res>
    implements $TarotHistoryStateCopyWith<$Res> {
  factory _$$TarotHistoryStateImplCopyWith(_$TarotHistoryStateImpl value,
          $Res Function(_$TarotHistoryStateImpl) then) =
      __$$TarotHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TarotHistory> record});
}

/// @nodoc
class __$$TarotHistoryStateImplCopyWithImpl<$Res>
    extends _$TarotHistoryStateCopyWithImpl<$Res, _$TarotHistoryStateImpl>
    implements _$$TarotHistoryStateImplCopyWith<$Res> {
  __$$TarotHistoryStateImplCopyWithImpl(_$TarotHistoryStateImpl _value,
      $Res Function(_$TarotHistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$TarotHistoryStateImpl(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<TarotHistory>,
    ));
  }
}

/// @nodoc

class _$TarotHistoryStateImpl implements _TarotHistoryState {
  const _$TarotHistoryStateImpl({required final List<TarotHistory> record})
      : _record = record;

  final List<TarotHistory> _record;
  @override
  List<TarotHistory> get record {
    if (_record is EqualUnmodifiableListView) return _record;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'TarotHistoryState(record: $record)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarotHistoryStateImpl &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarotHistoryStateImplCopyWith<_$TarotHistoryStateImpl> get copyWith =>
      __$$TarotHistoryStateImplCopyWithImpl<_$TarotHistoryStateImpl>(
          this, _$identity);
}

abstract class _TarotHistoryState implements TarotHistoryState {
  const factory _TarotHistoryState({required final List<TarotHistory> record}) =
      _$TarotHistoryStateImpl;

  @override
  List<TarotHistory> get record;
  @override
  @JsonKey(ignore: true)
  _$$TarotHistoryStateImplCopyWith<_$TarotHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
