// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot_today_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TarotTodayState {
  TarotOne get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotTodayStateCopyWith<TarotTodayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotTodayStateCopyWith<$Res> {
  factory $TarotTodayStateCopyWith(
          TarotTodayState value, $Res Function(TarotTodayState) then) =
      _$TarotTodayStateCopyWithImpl<$Res, TarotTodayState>;
  @useResult
  $Res call({TarotOne record});
}

/// @nodoc
class _$TarotTodayStateCopyWithImpl<$Res, $Val extends TarotTodayState>
    implements $TarotTodayStateCopyWith<$Res> {
  _$TarotTodayStateCopyWithImpl(this._value, this._then);

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
              as TarotOne,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarotTodayStateImplCopyWith<$Res>
    implements $TarotTodayStateCopyWith<$Res> {
  factory _$$TarotTodayStateImplCopyWith(_$TarotTodayStateImpl value,
          $Res Function(_$TarotTodayStateImpl) then) =
      __$$TarotTodayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TarotOne record});
}

/// @nodoc
class __$$TarotTodayStateImplCopyWithImpl<$Res>
    extends _$TarotTodayStateCopyWithImpl<$Res, _$TarotTodayStateImpl>
    implements _$$TarotTodayStateImplCopyWith<$Res> {
  __$$TarotTodayStateImplCopyWithImpl(
      _$TarotTodayStateImpl _value, $Res Function(_$TarotTodayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$TarotTodayStateImpl(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as TarotOne,
    ));
  }
}

/// @nodoc

class _$TarotTodayStateImpl implements _TarotTodayState {
  const _$TarotTodayStateImpl({required this.record});

  @override
  final TarotOne record;

  @override
  String toString() {
    return 'TarotTodayState(record: $record)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarotTodayStateImpl &&
            (identical(other.record, record) || other.record == record));
  }

  @override
  int get hashCode => Object.hash(runtimeType, record);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarotTodayStateImplCopyWith<_$TarotTodayStateImpl> get copyWith =>
      __$$TarotTodayStateImplCopyWithImpl<_$TarotTodayStateImpl>(
          this, _$identity);
}

abstract class _TarotTodayState implements TarotTodayState {
  const factory _TarotTodayState({required final TarotOne record}) =
      _$TarotTodayStateImpl;

  @override
  TarotOne get record;
  @override
  @JsonKey(ignore: true)
  _$$TarotTodayStateImplCopyWith<_$TarotTodayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
