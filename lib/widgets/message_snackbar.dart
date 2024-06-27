import 'package:flutter/material.dart';
import 'package:f7apparel_mobile/common/theme/colors.dart';

class HantspolSnackBar {
  static void showSuccessSnackBar(BuildContext context, {required String message, int milliseconds = 2000, SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: TDMColors.kTextOnSuccessColor,
        behavior: snackBarBehavior,
        action: SnackBarAction(textColor: TDMColors.kTextOnPrimaryColor, label: 'DISMISS', onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: TDMColors.kSuccessColor),
        ),
      ),
    );
  }

  static void showProgressSnackBar(BuildContext context, {required String message, int milliseconds = 10000, SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: TDMColors.kpendingBackgroundColor,
        behavior: snackBarBehavior,
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: TDMColors.kWhiteCardColor),
        ),
      ),
    );
  }

  static void showWarningSnackBar(BuildContext context, {required String message, int milliseconds = 300, SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: TDMColors.kAlertInfoTextColor,
        behavior: snackBarBehavior,
        action: SnackBarAction(textColor: TDMColors.kWhiteCardColor, label: 'DISMISS', onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(microseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: TDMColors.kSuccessColor),
        ),
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context, {required String message, int milliseconds = 2000, SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: TDMColors.kBellColor,
        behavior: snackBarBehavior,
        action: SnackBarAction(textColor: TDMColors.kTextOnPrimaryColor, label: 'DISMISS', onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: const TextStyle(color: TDMColors.kWhiteBackgroundColor),
        ),
      ),
    );
  }

  static void _dismissCurrentSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
