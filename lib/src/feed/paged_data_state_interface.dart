import 'package:freezed_annotation/freezed_annotation.dart';

// Necessary for code-generation to work
part 'paged_data_state_interface.freezed.dart';

@Freezed(copyWith: false)
interface class PagedDataStateInterface<T> with _$PagedDataStateInterface {
  const factory PagedDataStateInterface({
    @Default(0) int currentPage,
    @Default([]) List<T> stories,
    @Default(2) int storiesPerPage,
    @Default(false) bool isLoading,
    @Default(false) bool reachedEnd,
  }) = _PagedDataStateInterface;
}
