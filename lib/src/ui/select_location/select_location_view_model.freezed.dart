// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_location_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectLocationViewState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<String> get allIndianCities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectLocationViewStateCopyWith<SelectLocationViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectLocationViewStateCopyWith<$Res> {
  factory $SelectLocationViewStateCopyWith(SelectLocationViewState value,
          $Res Function(SelectLocationViewState) then) =
      _$SelectLocationViewStateCopyWithImpl<$Res, SelectLocationViewState>;
  @useResult
  $Res call({String searchQuery, List<String> allIndianCities});
}

/// @nodoc
class _$SelectLocationViewStateCopyWithImpl<$Res,
        $Val extends SelectLocationViewState>
    implements $SelectLocationViewStateCopyWith<$Res> {
  _$SelectLocationViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? allIndianCities = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      allIndianCities: null == allIndianCities
          ? _value.allIndianCities
          : allIndianCities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectLocationViewStateImplCopyWith<$Res>
    implements $SelectLocationViewStateCopyWith<$Res> {
  factory _$$SelectLocationViewStateImplCopyWith(
          _$SelectLocationViewStateImpl value,
          $Res Function(_$SelectLocationViewStateImpl) then) =
      __$$SelectLocationViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchQuery, List<String> allIndianCities});
}

/// @nodoc
class __$$SelectLocationViewStateImplCopyWithImpl<$Res>
    extends _$SelectLocationViewStateCopyWithImpl<$Res,
        _$SelectLocationViewStateImpl>
    implements _$$SelectLocationViewStateImplCopyWith<$Res> {
  __$$SelectLocationViewStateImplCopyWithImpl(
      _$SelectLocationViewStateImpl _value,
      $Res Function(_$SelectLocationViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? allIndianCities = null,
  }) {
    return _then(_$SelectLocationViewStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      allIndianCities: null == allIndianCities
          ? _value._allIndianCities
          : allIndianCities // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SelectLocationViewStateImpl implements _SelectLocationViewState {
  const _$SelectLocationViewStateImpl(
      {this.searchQuery = "", final List<String> allIndianCities = const []})
      : _allIndianCities = allIndianCities;

  @override
  @JsonKey()
  final String searchQuery;
  final List<String> _allIndianCities;
  @override
  @JsonKey()
  List<String> get allIndianCities {
    if (_allIndianCities is EqualUnmodifiableListView) return _allIndianCities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allIndianCities);
  }

  @override
  String toString() {
    return 'SelectLocationViewState(searchQuery: $searchQuery, allIndianCities: $allIndianCities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLocationViewStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._allIndianCities, _allIndianCities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery,
      const DeepCollectionEquality().hash(_allIndianCities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLocationViewStateImplCopyWith<_$SelectLocationViewStateImpl>
      get copyWith => __$$SelectLocationViewStateImplCopyWithImpl<
          _$SelectLocationViewStateImpl>(this, _$identity);
}

abstract class _SelectLocationViewState implements SelectLocationViewState {
  const factory _SelectLocationViewState(
      {final String searchQuery,
      final List<String> allIndianCities}) = _$SelectLocationViewStateImpl;

  @override
  String get searchQuery;
  @override
  List<String> get allIndianCities;
  @override
  @JsonKey(ignore: true)
  _$$SelectLocationViewStateImplCopyWith<_$SelectLocationViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
