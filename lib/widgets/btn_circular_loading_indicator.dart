
import 'package:flutter/material.dart';

import '../common/theme/colors.dart';

class ButtonCircularLoadingIndicator extends StatelessWidget {
  const ButtonCircularLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: TDMColors.buttonColor)),
      child: const SizedBox(
        width: 10.0,
        height: 10.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
