import 'package:flutter/widgets.dart';

/// Stateful widget which calls [onInit] function when state is initialized.
/// Should be used for example when in a block builder need on an initial state emit the next state
/// immediately and synchronously. Rebuild will work if [OnInitWidget] is used.
///
/// example:
/// BlocBuilder<MyCubit, MyCubitState>(
///   builder: (context, state) {
///     var cubit = context.read<MyCubit>();
///     switch (state):
///       case InitState:
///         return OnInitWidget(child: LoadingWidget(), onInit: (context) {
///           // here cubit synchronously maps data and emits SuccessState
///           // without using OnInitWidget immediate emit of new state in builder wouldn't
///           // trigger rebuild as BlockBuilder is not ready yet to listen to updates
///           cubit.showData();
///         });
///       case SuccessState:
///         return Text(state.data);
///   },
/// ),
class OnInitWidget extends StatefulWidget {
  final Function(BuildContext) onInit;
  final Widget? child;

  const OnInitWidget({
    required this.onInit,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OnInitWidgetState();
  }
}

class _OnInitWidgetState extends State<OnInitWidget> {
  _OnInitWidgetState();

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.onInit(context);
  }
}