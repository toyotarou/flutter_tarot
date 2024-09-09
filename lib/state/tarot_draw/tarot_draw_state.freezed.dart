// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot_draw_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TarotDrawState {
  List<TarotOne> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotDrawStateCopyWith<TarotDrawState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotDrawStateCopyWith<$Res> {
  factory $TarotDrawStateCopyWith(
          TarotDrawState value, $Res Function(TarotDrawState) then) =
      _$TarotDrawStateCopyWithImpl<$Res, TarotDrawState>;
  @useResult
  $Res call({List<TarotOne> record});
}

/// @nodoc
class _$TarotDrawStateCopyWithImpl<$Res, $Val extends TarotDrawState>
    implements $TarotDrawStateCopyWith<$Res> {
  _$TarotDrawStateCopyWithImpl(this._value, this._then);

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
              as List<TarotOne>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarotDrawStateImplCopyWith<$Res>
    implements $TarotDrawStateCopyWith<$Res> {
  factory _$$TarotDrawStateImplCopyWith(_$TarotDrawStateImpl value,
          $Res Function(_$TarotDrawStateImpl) then) =
      __$$TarotDrawStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TarotOne> record});
}

/// @nodoc
class __$$TarotDrawStateImplCopyWithImpl<$Res>
    extends _$TarotDrawStateCopyWithImpl<$Res, _$TarotDrawStateImpl>
    implements _$$TarotDrawStateImplCopyWith<$Res> {
  __$$TarotDrawStateImplCopyWithImpl(
      _$TarotDrawStateImpl _value, $Res Function(_$TarotDrawStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$TarotDrawStateImpl(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<TarotOne>,
    ));
  }
}

/// @nodoc

class _$TarotDrawStateImpl implements _TarotDrawState {
  const _$TarotDrawStateImpl({required final List<TarotOne> record})
      : _record = record;

  final List<TarotOne> _record;
  @override
  List<TarotOne> get record {
    if (_record is EqualUnmodifiableListView) return _record;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'TarotDrawState(record: $record)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarotDrawStateImpl &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarotDrawStateImplCopyWith<_$TarotDrawStateImpl> get copyWith =>
      __$$TarotDrawStateImplCopyWithImpl<_$TarotDrawStateImpl>(
          this, _$identity);
}

abstract class _TarotDrawState implements TarotDrawState {
  const factory _TarotDrawState({required final List<TarotOne> record}) =
      _$TarotDrawStateImpl;

  @override
  List<TarotOne> get record;
  @override
  @JsonKey(ignore: true)
  _$$TarotDrawStateImplCopyWith<_$TarotDrawStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
