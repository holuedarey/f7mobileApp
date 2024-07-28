abstract class SearchState {}

class InitialState extends SearchState {}

class LoadingState extends SearchState {}

class LoadedState extends SearchState {
  final List<String> words;

  LoadedState({required this.words});
}