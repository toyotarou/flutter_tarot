// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot_category_all_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TarotCategoryAllState {
  Map<String, List<TarotAll>> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TarotCategoryAllStateCopyWith<TarotCategoryAllState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TarotCategoryAllStateCopyWith<$Res> {
  factory $TarotCategoryAllStateCopyWith(TarotCategoryAllState value,
          $Res Function(TarotCategoryAllState) then) =
      _$TarotCategoryAllStateCopyWithImpl<$Res, TarotCategoryAllState>;
  @useResult
  $Res call({Map<String, List<TarotAll>> record});
}

/// @nodoc
class _$TarotCategoryAllStateCopyWithImpl<$Res,
        $Val extends TarotCategoryAllState>
    implements $TarotCategoryAllStateCopyWith<$Res> {
  _$TarotCategoryAllStateCopyWithImpl(this._value, this._then);

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
              as Map<String, List<TarotAll>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TarotCategoryAllStateImplCopyWith<$Res>
    implements $TarotCategoryAllStateCopyWith<$Res> {
  factory _$$TarotCategoryAllStateImplCopyWith(
          _$TarotCategoryAllStateImpl value,
          $Res Function(_$TarotCategoryAllStateImpl) then) =
      __$$TarotCategoryAllStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<TarotAll>> record});
}

/// @nodoc
class __$$TarotCategoryAllStateImplCopyWithImpl<$Res>
    extends _$TarotCategoryAllStateCopyWithImpl<$Res,
        _$TarotCategoryAllStateImpl>
    implements _$$TarotCategoryAllStateImplCopyWith<$Res> {
  __$$TarotCategoryAllStateImplCopyWithImpl(_$TarotCategoryAllStateImpl _value,
      $Res Function(_$TarotCategoryAllStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$TarotCategoryAllStateImpl(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TarotAll>>,
    ));
  }
}

/// @nodoc

class _$TarotCategoryAllStateImpl implements _TarotCategoryAllState {
  const _$TarotCategoryAllStateImpl(
      {required final Map<String, List<TarotAll>> record})
      : _record = record;

  final Map<String, List<TarotAll>> _record;
  @override
  Map<String, List<TarotAll>> get record {
    if (_record is EqualUnmodifiableMapView) return _record;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_record);
  }

  @override
  String toString() {
    return 'TarotCategoryAllState(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TarotCategoryAllStateImpl &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TarotCategoryAllStateImplCopyWith<_$TarotCategoryAllStateImpl>
      get copyWith => __$$TarotCategoryAllStateImplCopyWithImpl<
          _$TarotCategoryAllStateImpl>(this, _$identity);
}

abstract class _TarotCategoryAllState implements TarotCategoryAllState {
  const factory _TarotCategoryAllState(
          {required final Map<String, List<TarotAll>> record}) =
      _$TarotCategoryAllStateImpl;

  @override
  Map<String, List<TarotAll>> get record;
  @override
  @JsonKey(ignore: true)
  _$$TarotCategoryAllStateImplCopyWith<_$TarotCategoryAllStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
