// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot_rate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TarotRateState {
  List<TarotRate> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotRateStateCopyWith<TarotRateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotRateStateCopyWith<$Res> {
  factory $TarotRateStateCopyWith(
          TarotRateState value, $Res Function(TarotRateState) then) =
      _$TarotRateStateCopyWithImpl<$Res, TarotRateState>;
  @useResult
  $Res call({List<TarotRate> record});
}

/// @nodoc
class _$TarotRateStateCopyWithImpl<$Res, $Val extends TarotRateState>
    implements $TarotRateStateCopyWith<$Res> {
  _$TarotRateStateCopyWithImpl(this._value, this._then);

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
              as List<TarotRate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarotRateStateImplCopyWith<$Res>
    implements $TarotRateStateCopyWith<$Res> {
  factory _$$TarotRateStateImplCopyWith(_$TarotRateStateImpl value,
          $Res Function(_$TarotRateStateImpl) then) =
      __$$TarotRateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TarotRate> record});
}

/// @nodoc
class __$$TarotRateStateImplCopyWithImpl<$Res>
    extends _$TarotRateStateCopyWithImpl<$Res, _$TarotRateStateImpl>
    implements _$$TarotRateStateImplCopyWith<$Res> {
  __$$TarotRateStateImplCopyWithImpl(
      _$TarotRateStateImpl _value, $Res Function(_$TarotRateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$TarotRateStateImpl(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<TarotRate>,
    ));
  }
}

/// @nodoc

class _$TarotRateStateImpl implements _TarotRateState {
  const _$TarotRateStateImpl({required final List<TarotRate> record})
      : _record = record;

  final List<TarotRate> _record;
  @override
  List<TarotRate> get record {
    if (_record is EqualUnmodifiableListView) return _record;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'TarotRateState(record: $record)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarotRateStateImpl &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarotRateStateImplCopyWith<_$TarotRateStateImpl> get copyWith =>
      __$$TarotRateStateImplCopyWithImpl<_$TarotRateStateImpl>(
          this, _$identity);
}

abstract class _TarotRateState implements TarotRateState {
  const factory _TarotRateState({required final List<TarotRate> record}) =
      _$TarotRateStateImpl;

  @override
  List<TarotRate> get record;
  @override
  @JsonKey(ignore: true)
  _$$TarotRateStateImplCopyWith<_$TarotRateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
