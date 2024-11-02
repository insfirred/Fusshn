// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventViewState {
  List<EventData> get events => throw _privateConstructorUsedError;
  List<EventData> get filteredEvents => throw _privateConstructorUsedError;
  String? get selectedTag => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventViewStateCopyWith<EventViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventViewStateCopyWith<$Res> {
  factory $EventViewStateCopyWith(
          EventViewState value, $Res Function(EventViewState) then) =
      _$EventViewStateCopyWithImpl<$Res, EventViewState>;
  @useResult
  $Res call(
      {List<EventData> events,
      List<EventData> filteredEvents,
      String? selectedTag,
      String? errorMessage});
}

/// @nodoc
class _$EventViewStateCopyWithImpl<$Res, $Val extends EventViewState>
    implements $EventViewStateCopyWith<$Res> {
  _$EventViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? filteredEvents = null,
    Object? selectedTag = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
      filteredEvents: null == filteredEvents
          ? _value.filteredEvents
          : filteredEvents // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
      selectedTag: freezed == selectedTag
          ? _value.selectedTag
          : selectedTag // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventViewStateImplCopyWith<$Res>
    implements $EventViewStateCopyWith<$Res> {
  factory _$$EventViewStateImplCopyWith(_$EventViewStateImpl value,
          $Res Function(_$EventViewStateImpl) then) =
      __$$EventViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventData> events,
      List<EventData> filteredEvents,
      String? selectedTag,
      String? errorMessage});
}

/// @nodoc
class __$$EventViewStateImplCopyWithImpl<$Res>
    extends _$EventViewStateCopyWithImpl<$Res, _$EventViewStateImpl>
    implements _$$EventViewStateImplCopyWith<$Res> {
  __$$EventViewStateImplCopyWithImpl(
      _$EventViewStateImpl _value, $Res Function(_$EventViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? filteredEvents = null,
    Object? selectedTag = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$EventViewStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
      filteredEvents: null == filteredEvents
          ? _value._filteredEvents
          : filteredEvents // ignore: cast_nullable_to_non_nullable
              as List<EventData>,
      selectedTag: freezed == selectedTag
          ? _value.selectedTag
          : selectedTag // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EventViewStateImpl implements _EventViewState {
  const _$EventViewStateImpl(
      {required final List<EventData> events,
      final List<EventData> filteredEvents = const [],
      this.selectedTag,
      this.errorMessage})
      : _events = events,
        _filteredEvents = filteredEvents;

  final List<EventData> _events;
  @override
  List<EventData> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
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
  final String? selectedTag;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'EventViewState(events: $events, filteredEvents: $filteredEvents, selectedTag: $selectedTag, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventViewStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality()
                .equals(other._filteredEvents, _filteredEvents) &&
            (identical(other.selectedTag, selectedTag) ||
                other.selectedTag == selectedTag) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_filteredEvents),
      selectedTag,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventViewStateImplCopyWith<_$EventViewStateImpl> get copyWith =>
      __$$EventViewStateImplCopyWithImpl<_$EventViewStateImpl>(
          this, _$identity);
}

abstract class _EventViewState implements EventViewState {
  const factory _EventViewState(
      {required final List<EventData> events,
      final List<EventData> filteredEvents,
      final String? selectedTag,
      final String? errorMessage}) = _$EventViewStateImpl;

  @override
  List<EventData> get events;
  @override
  List<EventData> get filteredEvents;
  @override
  String? get selectedTag;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$EventViewStateImplCopyWith<_$EventViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
