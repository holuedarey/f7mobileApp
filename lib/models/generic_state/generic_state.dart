import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_state.freezed.dart';

@freezed
class GenericState<T> with _$GenericState {
  const factory GenericState.loading() = GenericLoadingState;
  const factory GenericState.init() = GenericInitialState;
  const factory GenericState.success([T? data]) = GenericSuccessState;
  const factory GenericState.successList(List<T> data) =
      GenericSuccessListState;
  const factory GenericState.loadingMore(List<T> data) =
      GenericLoadingMoreState;
  const factory GenericState.error([dynamic error]) = GenericErrorState;
  const factory GenericState.empty() = GenericEmptyState;
}
