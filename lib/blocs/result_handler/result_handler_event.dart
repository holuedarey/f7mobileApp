
class ResultHandlerEvent {}

class ResultHandlerEventShowError extends ResultHandlerEvent {
  final String? message;

  ResultHandlerEventShowError({required this.message});
}

class ResultHandlerEventShowSuccess extends ResultHandlerEvent {
  final String message;

  ResultHandlerEventShowSuccess({required this.message});
}
