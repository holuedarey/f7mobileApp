import 'package:flutter/material.dart';

import '../theme/colors.dart';

class HantspolSnackBar {
  static void showSuccessSnackBar(BuildContext context,
      {required String message,
      int milliseconds = 10000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: TDMColors.kTextOnSuccessColor,
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: TDMColors.kTextOnPrimaryColor,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: TDMColors.kSuccessColor),
        ),
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context,
      {required String message,
      int milliseconds = 10000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: TDMColors.kErrorBackgroundColor,
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: TDMColors.kTextOnPrimaryColor,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: TDMColors.kTextOnErrorColor),
        ),
      ),
    );
  }

  static void _dismissCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
