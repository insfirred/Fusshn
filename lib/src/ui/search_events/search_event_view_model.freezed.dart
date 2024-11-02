// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchEventViewState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<EventData> get allEvents => throw _privateConstructorUsedError;
  List<EventData> get filteredEvents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchEventViewStateCopyWith<SearchEventViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventViewStateCopyWith<$Res> {
  factory $SearchEventViewStateCopyWith(SearchEventViewState value,
          $Res Function(SearchEventViewState) then) =
      _$SearchEventViewStateCopyWithImpl<$Res, SearchEventViewState>;
  @useResult
  $Res call(
      {String searchQuery,
      List<EventData> allEvents,
      List<EventData> filteredEvents});
}

/// @nodoc
class _$SearchEventViewStateCopyWithImpl<$Res,
        $Val extends SearchEventViewState>
    implements $SearchEventViewStateCopyWith<$Res> {
  _$SearchEventViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? allEvents = null,
    Object? filteredEvents = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      allEvents: null == allEvents
          ? _value.allEvents
          : allEvents // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
      filteredEvents: null == filteredEvents
          ? _value.filteredEvents
          : filteredEvents // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchEventViewStateImplCopyWith<$Res>
    implements $SearchEventViewStateCopyWith<$Res> {
  factory _$$SearchEventViewStateImplCopyWith(_$SearchEventViewStateImpl value,
          $Res Function(_$SearchEventViewStateImpl) then) =
      __$$SearchEventViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      List<EventData> allEvents,
      List<EventData> filteredEvents});
}

/// @nodoc
class __$$SearchEventViewStateImplCopyWithImpl<$Res>
    extends _$SearchEventViewStateCopyWithImpl<$Res, _$SearchEventViewStateImpl>
    implements _$$SearchEventViewStateImplCopyWith<$Res> {
  __$$SearchEventViewStateImplCopyWithImpl(_$SearchEventViewStateImpl _value,
      $Res Function(_$SearchEventViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? allEvents = null,
    Object? filteredEvents = null,
  }) {
    return _then(_$SearchEventViewStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      allEvents: null == allEvents
          ? _value._allEvents
          : allEvents // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
      filteredEvents: null == filteredEvents
          ? _value._filteredEvents
          : filteredEvents // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
    ));
  }
}

/// @nodoc

class _$SearchEventViewStateImpl implements _SearchEventViewState {
  const _$SearchEventViewStateImpl(
      {this.searchQuery = "",
      required final List<EventData> allEvents,
      final List<EventData> filteredEvents = const []})
      : _allEvents = allEvents,
        _filteredEvents = filteredEvents;

  @override
  @JsonKey()
  final String searchQuery;
  final List<EventData> _allEvents;
  @override
  List<EventData> get allEvents {
    if (_allEvents is EqualUnmodifiableListView) return _allEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allEvents);
  }

  final List<EventData> _filteredEvents;
  @override
  @JsonKey()
  List<EventData> get filteredEvents {
    if (_filteredEvents is EqualUnmodifiableListView) return _filteredEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredEvents);
  }

  @override
  String toString() {
    return 'SearchEventViewState(searchQuery: $searchQuery, allEvents: $allEvents, filteredEvents: $filteredEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventViewStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._allEvents, _allEvents) &&
            const DeepCollectionEquality()
                .equals(other._filteredEvents, _filteredEvents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      const DeepCollectionEquality().hash(_allEvents),
      const DeepCollectionEquality().hash(_filteredEvents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventViewStateImplCopyWith<_$SearchEventViewStateImpl>
      get copyWith =>
          __$$SearchEventViewStateImplCopyWithImpl<_$SearchEventViewStateImpl>(
              this, _$identity);
}

abstract class _SearchEventViewState implements SearchEventViewState {
  const factory _SearchEventViewState(
      {final String searchQuery,
      required final List<EventData> allEvents,
      final List<EventData> filteredEvents}) = _$SearchEventViewStateImpl;

  @override
  String get searchQuery;
  @override
  List<EventData> get allEvents;
  @override
  List<EventData> get filteredEvents;
  @override
  @JsonKey(ignore: true)
  _$$SearchEventViewStateImplCopyWith<_$SearchEventViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
