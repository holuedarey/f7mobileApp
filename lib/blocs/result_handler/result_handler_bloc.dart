
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/configurations/tdm_snack_bar.dart';
import 'result_handler_event.dart';

class ResultHandlerBloc extends Bloc<ResultHandlerEvent, dynamic> {
  final BuildContext context;

  ResultHandlerBloc(this.context)
      : super(null);

  get initialState => null;

  @override
  Stream mapEventToState(ResultHandlerEvent event) async* {
    if (event is ResultHandlerEventShowSuccess) {
      HantspolSnackBar.showSuccessSnackBar(context, message: event.message);
    } else if (event is ResultHandlerEventShowError) {
      HantspolSnackBar.showErrorSnackBar(context, message: event.message!);
    }
  }
}
