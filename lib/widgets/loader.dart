// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class Loader {
//   static void show(BuildContext context) {
//     final theme = Theme.of(context);
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       useRootNavigator: false,
//       builder: (BuildContext context) => Center(
//         child: Container(
//           width: 60.0,
//           height: 60.0,
//           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
//           child: Center(
//             child: SpinKitFadingCircle(color: theme.primaryColor),
//           ),
//         ),
//       ),
//     );
//   }

//   static void dismiss(BuildContext context) {
//     // Navigator.of(context, rootNavigator: true).pop();
//     Navigator.pop(context, true);
//   }

// // static hideLoader(BuildContext context) {
// //   // Navigator.of(context).pop();
// //   Navigator.pop(context, true);
// }
