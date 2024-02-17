// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot_straight_all_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TarotStraightAllState {
  List<TarotAll> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotStraightAllStateCopyWith<TarotStraightAllState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotStraightAllStateCopyWith<$Res> {
  factory $TarotStraightAllStateCopyWith(TarotStraightAllState value,
          $Res Function(TarotStraightAllState) then) =
      _$TarotStraightAllStateCopyWithImpl<$Res, TarotStraightAllState>;
  @useResult
  $Res call({List<TarotAll> record});
}

/// @nodoc
class _$TarotStraightAllStateCopyWithImpl<$Res,
        $Val extends TarotStraightAllState>
    implements $TarotStraightAllStateCopyWith<$Res> {
  _$TarotStraightAllStateCopyWithImpl(this._value, this._then);

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
              as List<TarotAll>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarotStraightAllStateImplCopyWith<$Res>
    implements $TarotStraightAllStateCopyWith<$Res> {
  factory _$$TarotStraightAllStateImplCopyWith(
          _$TarotStraightAllStateImpl value,
          $Res Function(_$TarotStraightAllStateImpl) then) =
      __$$TarotStraightAllStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TarotAll> record});
}

/// @nodoc
class __$$TarotStraightAllStateImplCopyWithImpl<$Res>
    extends _$TarotStraightAllStateCopyWithImpl<$Res,
        _$TarotStraightAllStateImpl>
    implements _$$TarotStraightAllStateImplCopyWith<$Res> {
  __$$TarotStraightAllStateImplCopyWithImpl(_$TarotStraightAllStateImpl _value,
      $Res Function(_$TarotStraightAllStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$TarotStraightAllStateImpl(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<TarotAll>,
    ));
  }
}

/// @nodoc

class _$TarotStraightAllStateImpl implements _TarotStraightAllState {
  const _$TarotStraightAllStateImpl({required final List<TarotAll> record})
      : _record = record;

  final List<TarotAll> _record;
  @override
  List<TarotAll> get record {
    if (_record is EqualUnmodifiableListView) return _record;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'TarotStraightAllState(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarotStraightAllStateImpl &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarotStraightAllStateImplCopyWith<_$TarotStraightAllStateImpl>
      get copyWith => __$$TarotStraightAllStateImplCopyWithImpl<
          _$TarotStraightAllStateImpl>(this, _$identity);
}

abstract class _TarotStraightAllState implements TarotStraightAllState {
  const factory _TarotStraightAllState({required final List<TarotAll> record}) =
      _$TarotStraightAllStateImpl;

  @override
  List<TarotAll> get record;
  @override
  @JsonKey(ignore: true)
  _$$TarotStraightAllStateImplCopyWith<_$TarotStraightAllStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
