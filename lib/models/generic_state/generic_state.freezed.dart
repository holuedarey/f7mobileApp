// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenericState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(T? data) success,
    required TResult Function(List<T> data) successList,
    required TResult Function(List<T> data) loadingMore,
    required TResult Function(dynamic error) error,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? init,
    TResult? Function(T? data)? success,
    TResult? Function(List<T> data)? successList,
    TResult? Function(List<T> data)? loadingMore,
    TResult? Function(dynamic error)? error,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(T? data)? success,
    TResult Function(List<T> data)? successList,
    TResult Function(List<T> data)? loadingMore,
    TResult Function(dynamic error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericLoadingState<T> value) loading,
    required TResult Function(GenericInitialState<T> value) init,
    required TResult Function(GenericSuccessState<T> value) success,
    required TResult Function(GenericSuccessListState<T> value) successList,
    required TResult Function(GenericLoadingMoreState<T> value) loadingMore,
    required TResult Function(GenericErrorState<T> value) error,
    required TResult Function(GenericEmptyState<T> value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenericLoadingState<T> value)? loading,
    TResult? Function(GenericInitialState<T> value)? init,
    TResult? Function(GenericSuccessState<T> value)? success,
    TResult? Function(GenericSuccessListState<T> value)? successList,
    TResult? Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult? Function(GenericErrorState<T> value)? error,
    TResult? Function(GenericEmptyState<T> value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericLoadingState<T> value)? loading,
    TResult Function(GenericInitialState<T> value)? init,
    TResult Function(GenericSuccessState<T> value)? success,
    TResult Function(GenericSuccessListState<T> value)? successList,
    TResult Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult Function(GenericErrorState<T> value)? error,
    TResult Function(GenericEmptyState<T> value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericStateCopyWith<T, $Res> {
  factory $GenericStateCopyWith(
          GenericState<T> value, $Res Function(GenericState<T>) then) =
      _$GenericStateCopyWithImpl<T, $Res, GenericState<T>>;
}

/// @nodoc
class _$GenericStateCopyWithImpl<T, $Res, $Val extends GenericState<T>>
    implements $GenericStateCopyWith<T, $Res> {
  _$GenericStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GenericLoadingStateCopyWith<T, $Res> {
  factory _$$GenericLoadingStateCopyWith(_$GenericLoadingState<T> value,
          $Res Function(_$GenericLoadingState<T>) then) =
      __$$GenericLoadingStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GenericLoadingStateCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericLoadingState<T>>
    implements _$$GenericLoadingStateCopyWith<T, $Res> {
  __$$GenericLoadingStateCopyWithImpl(_$GenericLoadingState<T> _value,
      $Res Function(_$GenericLoadingState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenericLoadingState<T> implements GenericLoadingState<T> {
  const _$GenericLoadingState();

  @override
  String toString() {
    return 'GenericState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenericLoadingState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(T? data) success,
    required TResult Function(List<T> data) successList,
    required TResult Function(List<T> data) loadingMore,
    required TResult Function(dynamic error) error,
    required TResult Function() empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? init,
    TResult? Function(T? data)? success,
    TResult? Function(List<T> data)? successList,
    TResult? Function(List<T> data)? loadingMore,
    TResult? Function(dynamic error)? error,
    TResult? Function()? empty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(T? data)? success,
    TResult Function(List<T> data)? successList,
    TResult Function(List<T> data)? loadingMore,
    TResult Function(dynamic error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericLoadingState<T> value) loading,
    required TResult Function(GenericInitialState<T> value) init,
    required TResult Function(GenericSuccessState<T> value) success,
    required TResult Function(GenericSuccessListState<T> value) successList,
    required TResult Function(GenericLoadingMoreState<T> value) loadingMore,
    required TResult Function(GenericErrorState<T> value) error,
    required TResult Function(GenericEmptyState<T> value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenericLoadingState<T> value)? loading,
    TResult? Function(GenericInitialState<T> value)? init,
    TResult? Function(GenericSuccessState<T> value)? success,
    TResult? Function(GenericSuccessListState<T> value)? successList,
    TResult? Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult? Function(GenericErrorState<T> value)? error,
    TResult? Function(GenericEmptyState<T> value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericLoadingState<T> value)? loading,
    TResult Function(GenericInitialState<T> value)? init,
    TResult Function(GenericSuccessState<T> value)? success,
    TResult Function(GenericSuccessListState<T> value)? successList,
    TResult Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult Function(GenericErrorState<T> value)? error,
    TResult Function(GenericEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GenericLoadingState<T> implements GenericState<T> {
  const factory GenericLoadingState() = _$GenericLoadingState<T>;
}

/// @nodoc
abstract class _$$GenericInitialStateCopyWith<T, $Res> {
  factory _$$GenericInitialStateCopyWith(_$GenericInitialState<T> value,
          $Res Function(_$GenericInitialState<T>) then) =
      __$$GenericInitialStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GenericInitialStateCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericInitialState<T>>
    implements _$$GenericInitialStateCopyWith<T, $Res> {
  __$$GenericInitialStateCopyWithImpl(_$GenericInitialState<T> _value,
      $Res Function(_$GenericInitialState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenericInitialState<T> implements GenericInitialState<T> {
  const _$GenericInitialState();

  @override
  String toString() {
    return 'GenericState<$T>.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenericInitialState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(T? data) success,
    required TResult Function(List<T> data) successList,
    required TResult Function(List<T> data) loadingMore,
    required TResult Function(dynamic error) error,
    required TResult Function() empty,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? init,
    TResult? Function(T? data)? success,
    TResult? Function(List<T> data)? successList,
    TResult? Function(List<T> data)? loadingMore,
    TResult? Function(dynamic error)? error,
    TResult? Function()? empty,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(T? data)? success,
    TResult Function(List<T> data)? successList,
    TResult Function(List<T> data)? loadingMore,
    TResult Function(dynamic error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericLoadingState<T> value) loading,
    required TResult Function(GenericInitialState<T> value) init,
    required TResult Function(GenericSuccessState<T> value) success,
    required TResult Function(GenericSuccessListState<T> value) successList,
    required TResult Function(GenericLoadingMoreState<T> value) loadingMore,
    required TResult Function(GenericErrorState<T> value) error,
    required TResult Function(GenericEmptyState<T> value) empty,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenericLoadingState<T> value)? loading,
    TResult? Function(GenericInitialState<T> value)? init,
    TResult? Function(GenericSuccessState<T> value)? success,
    TResult? Function(GenericSuccessListState<T> value)? successList,
    TResult? Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult? Function(GenericErrorState<T> value)? error,
    TResult? Function(GenericEmptyState<T> value)? empty,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericLoadingState<T> value)? loading,
    TResult Function(GenericInitialState<T> value)? init,
    TResult Function(GenericSuccessState<T> value)? success,
    TResult Function(GenericSuccessListState<T> value)? successList,
    TResult Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult Function(GenericErrorState<T> value)? error,
    TResult Function(GenericEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class GenericInitialState<T> implements GenericState<T> {
  const factory GenericInitialState() = _$GenericInitialState<T>;
}

/// @nodoc
abstract class _$$GenericSuccessStateCopyWith<T, $Res> {
  factory _$$GenericSuccessStateCopyWith(_$GenericSuccessState<T> value,
          $Res Function(_$GenericSuccessState<T>) then) =
      __$$GenericSuccessStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$GenericSuccessStateCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericSuccessState<T>>
    implements _$$GenericSuccessStateCopyWith<T, $Res> {
  __$$GenericSuccessStateCopyWithImpl(_$GenericSuccessState<T> _value,
      $Res Function(_$GenericSuccessState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GenericSuccessState<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$GenericSuccessState<T> implements GenericSuccessState<T> {
  const _$GenericSuccessState([this.data]);

  @override
  final T? data;

  @override
  String toString() {
    return 'GenericState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericSuccessState<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericSuccessStateCopyWith<T, _$GenericSuccessState<T>> get copyWith =>
      __$$GenericSuccessStateCopyWithImpl<T, _$GenericSuccessState<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(T? data) success,
    required TResult Function(List<T> data) successList,
    required TResult Function(List<T> data) loadingMore,
    required TResult Function(dynamic error) error,
    required TResult Function() empty,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? init,
    TResult? Function(T? data)? success,
    TResult? Function(List<T> data)? successList,
    TResult? Function(List<T> data)? loadingMore,
    TResult? Function(dynamic error)? error,
    TResult? Function()? empty,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(T? data)? success,
    TResult Function(List<T> data)? successList,
    TResult Function(List<T> data)? loadingMore,
    TResult Function(dynamic error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericLoadingState<T> value) loading,
    required TResult Function(GenericInitialState<T> value) init,
    required TResult Function(GenericSuccessState<T> value) success,
    required TResult Function(GenericSuccessListState<T> value) successList,
    required TResult Function(GenericLoadingMoreState<T> value) loadingMore,
    required TResult Function(GenericErrorState<T> value) error,
    required TResult Function(GenericEmptyState<T> value) empty,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenericLoadingState<T> value)? loading,
    TResult? Function(GenericInitialState<T> value)? init,
    TResult? Function(GenericSuccessState<T> value)? success,
    TResult? Function(GenericSuccessListState<T> value)? successList,
    TResult? Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult? Function(GenericErrorState<T> value)? error,
    TResult? Function(GenericEmptyState<T> value)? empty,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericLoadingState<T> value)? loading,
    TResult Function(GenericInitialState<T> value)? init,
    TResult Function(GenericSuccessState<T> value)? success,
    TResult Function(GenericSuccessListState<T> value)? successList,
    TResult Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult Function(GenericErrorState<T> value)? error,
    TResult Function(GenericEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GenericSuccessState<T> implements GenericState<T> {
  const factory GenericSuccessState([final T? data]) = _$GenericSuccessState<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$GenericSuccessStateCopyWith<T, _$GenericSuccessState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenericSuccessListStateCopyWith<T, $Res> {
  factory _$$GenericSuccessListStateCopyWith(_$GenericSuccessListState<T> value,
          $Res Function(_$GenericSuccessListState<T>) then) =
      __$$GenericSuccessListStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> data});
}

/// @nodoc
class __$$GenericSuccessListStateCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericSuccessListState<T>>
    implements _$$GenericSuccessListStateCopyWith<T, $Res> {
  __$$GenericSuccessListStateCopyWithImpl(_$GenericSuccessListState<T> _value,
      $Res Function(_$GenericSuccessListState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GenericSuccessListState<T>(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$GenericSuccessListState<T> implements GenericSuccessListState<T> {
  const _$GenericSuccessListState(final List<T> data) : _data = data;

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GenericState<$T>.successList(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericSuccessListState<T> &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericSuccessListStateCopyWith<T, _$GenericSuccessListState<T>>
      get copyWith => __$$GenericSuccessListStateCopyWithImpl<T,
          _$GenericSuccessListState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(T? data) success,
    required TResult Function(List<T> data) successList,
    required TResult Function(List<T> data) loadingMore,
    required TResult Function(dynamic error) error,
    required TResult Function() empty,
  }) {
    return successList(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? init,
    TResult? Function(T? data)? success,
    TResult? Function(List<T> data)? successList,
    TResult? Function(List<T> data)? loadingMore,
    TResult? Function(dynamic error)? error,
    TResult? Function()? empty,
  }) {
    return successList?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(T? data)? success,
    TResult Function(List<T> data)? successList,
    TResult Function(List<T> data)? loadingMore,
    TResult Function(dynamic error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (successList != null) {
      return successList(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericLoadingState<T> value) loading,
    required TResult Function(GenericInitialState<T> value) init,
    required TResult Function(GenericSuccessState<T> value) success,
    required TResult Function(GenericSuccessListState<T> value) successList,
    required TResult Function(GenericLoadingMoreState<T> value) loadingMore,
    required TResult Function(GenericErrorState<T> value) error,
    required TResult Function(GenericEmptyState<T> value) empty,
  }) {
    return successList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenericLoadingState<T> value)? loading,
    TResult? Function(GenericInitialState<T> value)? init,
    TResult? Function(GenericSuccessState<T> value)? success,
    TResult? Function(GenericSuccessListState<T> value)? successList,
    TResult? Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult? Function(GenericErrorState<T> value)? error,
    TResult? Function(GenericEmptyState<T> value)? empty,
  }) {
    return successList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericLoadingState<T> value)? loading,
    TResult Function(GenericInitialState<T> value)? init,
    TResult Function(GenericSuccessState<T> value)? success,
    TResult Function(GenericSuccessListState<T> value)? successList,
    TResult Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult Function(GenericErrorState<T> value)? error,
    TResult Function(GenericEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (successList != null) {
      return successList(this);
    }
    return orElse();
  }
}

abstract class GenericSuccessListState<T> implements GenericState<T> {
  const factory GenericSuccessListState(final List<T> data) =
      _$GenericSuccessListState<T>;

  List<T> get data;
  @JsonKey(ignore: true)
  _$$GenericSuccessListStateCopyWith<T, _$GenericSuccessListState<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenericLoadingMoreStateCopyWith<T, $Res> {
  factory _$$GenericLoadingMoreStateCopyWith(_$GenericLoadingMoreState<T> value,
          $Res Function(_$GenericLoadingMoreState<T>) then) =
      __$$GenericLoadingMoreStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> data});
}

/// @nodoc
class __$$GenericLoadingMoreStateCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericLoadingMoreState<T>>
    implements _$$GenericLoadingMoreStateCopyWith<T, $Res> {
  __$$GenericLoadingMoreStateCopyWithImpl(_$GenericLoadingMoreState<T> _value,
      $Res Function(_$GenericLoadingMoreState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GenericLoadingMoreState<T>(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$GenericLoadingMoreState<T> implements GenericLoadingMoreState<T> {
  const _$GenericLoadingMoreState(final List<T> data) : _data = data;

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GenericState<$T>.loadingMore(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericLoadingMoreState<T> &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericLoadingMoreStateCopyWith<T, _$GenericLoadingMoreState<T>>
      get copyWith => __$$GenericLoadingMoreStateCopyWithImpl<T,
          _$GenericLoadingMoreState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(T? data) success,
    required TResult Function(List<T> data) successList,
    required TResult Function(List<T> data) loadingMore,
    required TResult Function(dynamic error) error,
    required TResult Function() empty,
  }) {
    return loadingMore(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? init,
    TResult? Function(T? data)? success,
    TResult? Function(List<T> data)? successList,
    TResult? Function(List<T> data)? loadingMore,
    TResult? Function(dynamic error)? error,
    TResult? Function()? empty,
  }) {
    return loadingMore?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(T? data)? success,
    TResult Function(List<T> data)? successList,
    TResult Function(List<T> data)? loadingMore,
    TResult Function(dynamic error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericLoadingState<T> value) loading,
    required TResult Function(GenericInitialState<T> value) init,
    required TResult Function(GenericSuccessState<T> value) success,
    required TResult Function(GenericSuccessListState<T> value) successList,
    required TResult Function(GenericLoadingMoreState<T> value) loadingMore,
    required TResult Function(GenericErrorState<T> value) error,
    required TResult Function(GenericEmptyState<T> value) empty,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenericLoadingState<T> value)? loading,
    TResult? Function(GenericInitialState<T> value)? init,
    TResult? Function(GenericSuccessState<T> value)? success,
    TResult? Function(GenericSuccessListState<T> value)? successList,
    TResult? Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult? Function(GenericErrorState<T> value)? error,
    TResult? Function(GenericEmptyState<T> value)? empty,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericLoadingState<T> value)? loading,
    TResult Function(GenericInitialState<T> value)? init,
    TResult Function(GenericSuccessState<T> value)? success,
    TResult Function(GenericSuccessListState<T> value)? successList,
    TResult Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult Function(GenericErrorState<T> value)? error,
    TResult Function(GenericEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class GenericLoadingMoreState<T> implements GenericState<T> {
  const factory GenericLoadingMoreState(final List<T> data) =
      _$GenericLoadingMoreState<T>;

  List<T> get data;
  @JsonKey(ignore: true)
  _$$GenericLoadingMoreStateCopyWith<T, _$GenericLoadingMoreState<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenericErrorStateCopyWith<T, $Res> {
  factory _$$GenericErrorStateCopyWith(_$GenericErrorState<T> value,
          $Res Function(_$GenericErrorState<T>) then) =
      __$$GenericErrorStateCopyWithImpl<T, $Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$GenericErrorStateCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericErrorState<T>>
    implements _$$GenericErrorStateCopyWith<T, $Res> {
  __$$GenericErrorStateCopyWithImpl(_$GenericErrorState<T> _value,
      $Res Function(_$GenericErrorState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$GenericErrorState<T>(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$GenericErrorState<T> implements GenericErrorState<T> {
  const _$GenericErrorState([this.error]);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'GenericState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericErrorState<T> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericErrorStateCopyWith<T, _$GenericErrorState<T>> get copyWith =>
      __$$GenericErrorStateCopyWithImpl<T, _$GenericErrorState<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(T? data) success,
    required TResult Function(List<T> data) successList,
    required TResult Function(List<T> data) loadingMore,
    required TResult Function(dynamic error) error,
    required TResult Function() empty,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? init,
    TResult? Function(T? data)? success,
    TResult? Function(List<T> data)? successList,
    TResult? Function(List<T> data)? loadingMore,
    TResult? Function(dynamic error)? error,
    TResult? Function()? empty,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(T? data)? success,
    TResult Function(List<T> data)? successList,
    TResult Function(List<T> data)? loadingMore,
    TResult Function(dynamic error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericLoadingState<T> value) loading,
    required TResult Function(GenericInitialState<T> value) init,
    required TResult Function(GenericSuccessState<T> value) success,
    required TResult Function(GenericSuccessListState<T> value) successList,
    required TResult Function(GenericLoadingMoreState<T> value) loadingMore,
    required TResult Function(GenericErrorState<T> value) error,
    required TResult Function(GenericEmptyState<T> value) empty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenericLoadingState<T> value)? loading,
    TResult? Function(GenericInitialState<T> value)? init,
    TResult? Function(GenericSuccessState<T> value)? success,
    TResult? Function(GenericSuccessListState<T> value)? successList,
    TResult? Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult? Function(GenericErrorState<T> value)? error,
    TResult? Function(GenericEmptyState<T> value)? empty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericLoadingState<T> value)? loading,
    TResult Function(GenericInitialState<T> value)? init,
    TResult Function(GenericSuccessState<T> value)? success,
    TResult Function(GenericSuccessListState<T> value)? successList,
    TResult Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult Function(GenericErrorState<T> value)? error,
    TResult Function(GenericEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GenericErrorState<T> implements GenericState<T> {
  const factory GenericErrorState([final dynamic error]) =
      _$GenericErrorState<T>;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$GenericErrorStateCopyWith<T, _$GenericErrorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenericEmptyStateCopyWith<T, $Res> {
  factory _$$GenericEmptyStateCopyWith(_$GenericEmptyState<T> value,
          $Res Function(_$GenericEmptyState<T>) then) =
      __$$GenericEmptyStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$GenericEmptyStateCopyWithImpl<T, $Res>
    extends _$GenericStateCopyWithImpl<T, $Res, _$GenericEmptyState<T>>
    implements _$$GenericEmptyStateCopyWith<T, $Res> {
  __$$GenericEmptyStateCopyWithImpl(_$GenericEmptyState<T> _value,
      $Res Function(_$GenericEmptyState<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GenericEmptyState<T> implements GenericEmptyState<T> {
  const _$GenericEmptyState();

  @override
  String toString() {
    return 'GenericState<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenericEmptyState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() init,
    required TResult Function(T? data) success,
    required TResult Function(List<T> data) successList,
    required TResult Function(List<T> data) loadingMore,
    required TResult Function(dynamic error) error,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? init,
    TResult? Function(T? data)? success,
    TResult? Function(List<T> data)? successList,
    TResult? Function(List<T> data)? loadingMore,
    TResult? Function(dynamic error)? error,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? init,
    TResult Function(T? data)? success,
    TResult Function(List<T> data)? successList,
    TResult Function(List<T> data)? loadingMore,
    TResult Function(dynamic error)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenericLoadingState<T> value) loading,
    required TResult Function(GenericInitialState<T> value) init,
    required TResult Function(GenericSuccessState<T> value) success,
    required TResult Function(GenericSuccessListState<T> value) successList,
    required TResult Function(GenericLoadingMoreState<T> value) loadingMore,
    required TResult Function(GenericErrorState<T> value) error,
    required TResult Function(GenericEmptyState<T> value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenericLoadingState<T> value)? loading,
    TResult? Function(GenericInitialState<T> value)? init,
    TResult? Function(GenericSuccessState<T> value)? success,
    TResult? Function(GenericSuccessListState<T> value)? successList,
    TResult? Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult? Function(GenericErrorState<T> value)? error,
    TResult? Function(GenericEmptyState<T> value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenericLoadingState<T> value)? loading,
    TResult Function(GenericInitialState<T> value)? init,
    TResult Function(GenericSuccessState<T> value)? success,
    TResult Function(GenericSuccessListState<T> value)? successList,
    TResult Function(GenericLoadingMoreState<T> value)? loadingMore,
    TResult Function(GenericErrorState<T> value)? error,
    TResult Function(GenericEmptyState<T> value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class GenericEmptyState<T> implements GenericState<T> {
  const factory GenericEmptyState() = _$GenericEmptyState<T>;
}
