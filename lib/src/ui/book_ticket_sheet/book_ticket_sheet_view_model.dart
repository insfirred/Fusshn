import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/ticket_type.dart';

part 'book_ticket_sheet_view_model.freezed.dart';

final bookTicketSheetViewModelProvider = StateNotifierProvider.autoDispose<
    BookTicketSheetViewModel, BookTicketSheetViewState>(
  (ref) => BookTicketSheetViewModel(),
);

class BookTicketSheetViewModel extends StateNotifier<BookTicketSheetViewState> {
  BookTicketSheetViewModel() : super(const BookTicketSheetViewState());

  setTicketType(TicketType? type) => state = state.copyWith(
        selectedTicketType: type,
        selectedTicketCount: 0,
      );

  setTicketCount(int count) =>
      state = state.copyWith(selectedTicketCount: count);

  setEventId(String eventId) => state = state.copyWith(eventId: eventId);
}

@freezed
class BookTicketSheetViewState with _$BookTicketSheetViewState {
  const factory BookTicketSheetViewState({
    TicketType? selectedTicketType,
    @Default(0) int selectedTicketCount,
    @Default('') String eventId,
    String? error,
  }) = _BookTicketSheetViewState;
}
