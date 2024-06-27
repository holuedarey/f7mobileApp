import 'package:flutter/material.dart';

class BottomSheets {
  static Future<T?> showSheet<T>(BuildContext context,
      {required Widget child}) {
    return showModalBottomSheet<T>(
        isDismissible: false,
        isScrollControlled: true,
        // backgroundColor: Colors.white.withOpacity(0.8),
        enableDrag: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        context: context,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.maximize),
              Flexible(child: child),
            ],
          );
        });
  }

  static PersistentBottomSheetController<T> showPersistentSheet<T>(
      BuildContext context,
      {required Widget child}) {
    return showBottomSheet<T>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        context: context,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.maximize),
              Flexible(child: child),
            ],
          );
        });
  }

  static void showDurationPickerSheet(BuildContext context,
      {required String title, required String subtitle}) {}
}
