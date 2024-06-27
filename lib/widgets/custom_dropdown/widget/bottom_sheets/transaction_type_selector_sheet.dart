// import 'package:flutter/material.dart';
// import 'package:trusteddealmaker/models/type_model.dart';
// import '../../utils/enum.dart';
// import '../../utils/flutter_custom_select_item.dart';
// import '../../utils/utils.dart';
// import '../flutter_custom_select_button.dart';
//
// class TransactionTypeBottomSheet<T> {
//   Future<Map<String, List<T>?>> customBottomSheet({
//     required BuildContext buildContext,
//     required String headerName,
//     required CustomDropdownButtonType buttonType,
//     required List<CustomMultiSelectDropdownItem<T>> dropdownItems,
//     required List<T> initialSelection,
//     required Color selectedItemColor,
//     bool isAllOptionEnable = false,
//   }) async {
//     List<T> _selectedList = <T>[];
//     bool _selectionDone = false;
//     List<CustomMultiSelectDropdownItem<T>> _searchedItems =
//         <CustomMultiSelectDropdownItem<T>>[];
//
//     for (T value in initialSelection) {
//       _selectedList.add(value);
//     }
//
//     for (int i = 0; i < dropdownItems.length; i++) {
//       if (_selectedList.contains(dropdownItems[i].buttonObjectValue)) {
//         dropdownItems[i].selected = true;
//       }
//     }
//
//     await showModalBottomSheet(
//         context: buildContext,
//         backgroundColor: Colors.transparent,
//         enableDrag: true,
//         builder: (BuildContext bc) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Flexible(
//                 child: Container(
//                   clipBehavior: Clip.antiAlias,
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: StatefulBuilder(builder: (_, setState) {
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           color: Colors.grey.shade200,
//                           width: double.infinity,
//                           alignment: Alignment.center,
//                           child: Text(
//                             headerName,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               // decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           child: ListView(
//                             shrinkWrap: true,
//                             physics: const AlwaysScrollableScrollPhysics(),
//                             children: [
//                               Wrap(
//                                 children: [
//                                   for (CustomMultiSelectDropdownItem<T> _item in _searchedItems.isNotEmpty ? _searchedItems : dropdownItems)
//                                     Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         CustomBottomSheetButton(
//                                           onPressed: () {
//                                               _selectedList.clear();
//                                               _selectedList.add(_item.buttonObjectValue);
//                                               _selectionDone = true;
//                                               Navigator.pop(buildContext,);
//                                             // }
//                                           },
//                                           buttonTextStyle: defaultTextStyle(
//                                               color: _item.selected ? selectedItemColor : Colors.black),
//                                           buttonText: (_item.buttonObjectValue as TypeModel).type ?? '',
//                                         ),
//                                         Container(
//                                           height: _item != dropdownItems.last ? 0.5 : 0,
//                                           width: double.infinity,
//                                           color: Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 4,
//                         ),
//                       ],
//                     );
//                   }),
//                 ),
//               ),
//               buttonType == CustomDropdownButtonType.multiSelect
//                   ? Container(
//                       width: MediaQuery.of(bc).size.width - 40,
//                       margin: const EdgeInsets.only(top: 10, bottom: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: MaterialButton(
//                         onPressed: () {
//                           _selectionDone = true;
//                           Navigator.pop(buildContext,);
//                         },
//                         color: Colors.grey.shade200,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         minWidth: MediaQuery.of(bc).size.width - 40,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10),
//                           child: const Center(
//                             child: Text(
//                               "Done",
//                               style: TextStyle(
//                                 // color: pink,
//                                 // fontFamily: fontsFamily.MontserratMedium,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   : Container(
//                       width: MediaQuery.of(bc).size.width - 40,
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: MaterialButton(
//                         onPressed: () {
//                           _selectionDone = false;
//                           Navigator.pop(buildContext);
//                         },
//                         color: Colors.grey.shade200,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         minWidth: MediaQuery.of(bc).size.width - 40,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10),
//                           child: const Center(
//                             child: Text(
//                               "Cancel",
//                               style: TextStyle(
//                                 // color: pink,
//                                 // fontFamily: fontsFamily.MontserratMedium,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//             ],
//           );
//         });
//     return {
//       selectedList: _selectionDone ? _selectedList : null,
//     };
//   }
// }
