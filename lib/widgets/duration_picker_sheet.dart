// import 'package:collection/collection.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:f7apparel_mobile/common/theme/colors.dart';
// import 'package:f7apparel_mobile/widgets/buttons.dart';
// import 'package:f7apparel_mobile/widgets/custom_text_form_field.dart';

// class BottomSheets {
//   static Future<T?> showSheet<T>(BuildContext context,
//       {required Widget child}) {
//     return showModalBottomSheet<T>(
//         isDismissible: false,
//         isScrollControlled: true,
//         // backgroundColor: Colors.white.withOpacity(0.8),
//         enableDrag: true,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12), topRight: Radius.circular(12))),
//         context: context,
//         builder: (_) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const Icon(Icons.maximize),
//               Flexible(child: child),
//             ],
//           );
//         });

//   }

//   static PersistentBottomSheetController<T> showPersistentSheet<T>(
//       BuildContext context,
//       {required Widget child}) {
//     return showBottomSheet<T>(
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12), topRight: Radius.circular(12))),
//         context: context,
//         builder: (_) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const Icon(Icons.maximize),
//               Flexible(child: child),
//             ],
//           );
//         });
//   }

//   static Future<T?> showOptionsSheet<T>(BuildContext context,
//       {required List<OptionsSheetItem> options}) {
//     return showModalBottomSheet<T>(
//         enableDrag: false,
//         backgroundColor: Colors.transparent,
//         context: context,
//         builder: (_) {
//           return _OptionsSheet(
//             options: options,
//           );
//         });
//   }

//   static Future<T?> showTimePickerSheet<T>(BuildContext context,
//       {required String title, String? subtitle, TimeOfDay? initialTime}) {
//     return showModalBottomSheet<T>(
//         enableDrag: true,
//         // showDragHandle: true,
//         context: context,
//         builder: (context) {
//           return SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     title,
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 64,
//                     child: subtitle == null
//                         ? null
//                         : Align(
//                             alignment: AlignmentDirectional.topStart,
//                             child: Text(subtitle),
//                           ),
//                   ),
//                   TimePickerInput(
//                     initialValue: initialTime ?? TimeOfDay.now(),
//                   ),
//                   const SizedBox(height: 76),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlineBigButton(
//                           boderRadius: 4,
//                           borderColor: TDMColors.kPrimaryLightColor,
//                           textColor: TDMColors.kPrimaryLightColor,
//                           backgroundColor: Colors.transparent,
//                           onPressed: () {},
//                           child: const Text(
//                             "Cancel",
//                             style: TextStyle(
//                               color: TDMColors.kPrimaryLightColor,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 24),
//                       Expanded(
//                         child: BigButton(
//                           text: "Set Time",
//                           onPressed: () {
//                             // Should pop with timeOfDay from time picker ideally
//                             Navigator.pop(context);
//                           },
//                           borderRadius: 4,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                 ],
//               ),
//             ),
//           );
//         });
//   }



//   static Future<T?> showDurationPickerSheet<T>(BuildContext context,
//       {required String title,
//       String? subtitle,
//       String? startTime,
//       String? endTime}) {
//     return showModalBottomSheet<T>(
//       enableDrag: true,
//       // showDragHandle: true,
//       context: context,
//       builder: (context) {
//         return SafeArea(
//           child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
//               child: ListView(
//                 shrinkWrap: true,
//                 children: [
//                   Text(
//                     title,
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 64,
//                     child: subtitle == null
//                         ? null
//                         : Align(
//                             alignment: AlignmentDirectional.topStart,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 6.0),
//                               child: Text(subtitle),
//                             ),
//                           ),
//                   ),
//                   const TimePickerInput(),
//                   const SizedBox(height: 24),
//                   Container(
//                     height: 40,
//                     width: 40,
//                     alignment: Alignment.center,
//                     decoration: const BoxDecoration(
//                       color: TDMColors.grey200,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.arrow_downward_rounded,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   const TimePickerInput(),
//                   const SizedBox(height: 20),
//                   const SizedBox(height: 44),
//                   Row(
//                     children: [
//                       const Expanded(
//                         child: OutlineBigButton(
//                           boderRadius: 4,
//                           borderColor: TDMColors.kPrimaryLightColor,
//                           textColor: TDMColors.kPrimaryLightColor,
//                           backgroundColor: Colors.transparent,
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(
//                               color: TDMColors.kPrimaryLightColor,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 24),
//                       Expanded(
//                         child: BigButton(
//                           text: "Set Duration",
//                           onPressed: () {
//                             // Should pop with timeOfDay from time picker ideally
//                             Navigator.pop(context);
//                           },
//                           borderRadius: 4,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               )),
//         );
//       },
//     );
//   }
// }

// class TimePickerInput extends StatefulWidget {
//   // final TimeProvider? timeProvider;
//   const TimePickerInput(
//       {Key? key,
//       // this.timeProvider,
//       this.onChanged,
//       this.initialValue = const TimeOfDay(hour: 0, minute: 0),
//       this.isEndbreak})
//       : super(key: key);

//   final ValueChanged<TimeOfDay>? onChanged;
//   final TimeOfDay initialValue;
//   final bool? isEndbreak;
//   @override
//   State<TimePickerInput> createState() => _TimePickerInputState();
// }

// class _TimePickerInputState extends State<TimePickerInput> {
//   // late TimeOfDay timeOfDay;
//   TimeOfDay timeOfDay = TimeOfDay.now();
//   TimeOfDay startBreakTime = TimeOfDay.now();
//   TimeOfDay endBreakTime = TimeOfDay.now();
//   String breakDuration = '';


//   final startBreakControllerHour = TextEditingController();
//   final startBreakControllerHourMin = TextEditingController();

//   @override
//   void initState() {
//     startBreakControllerHour.text =
//         '${timeOfDay.hour.toString().padLeft(2, '0')}}';

//     timeOfDay = widget.initialValue;
//     super.initState();
//   }

//   void updateHours(String newValue) {
//     timeOfDay = timeOfDay.replacing(hour: int.parse(newValue));
//     widget.onChanged?.call(timeOfDay);
//   }

//   void updateMinutes(String newValue) {
//     timeOfDay = timeOfDay.replacing(minute: int.parse(newValue));
//     widget.onChanged?.call(timeOfDay);
//   }
//   String getBreakDuration() {
//     // if (startBreakTime == null || endBreakTime == null) return '';

//     final startMinutes = startBreakTime.hour * 60 + startBreakTime.minute;
//     final endMinutes = endBreakTime.hour * 60 + endBreakTime.minute;

//     final differenceInMinutes = (endMinutes - startMinutes).abs();
//     final hours = (differenceInMinutes / 60).floor();
//     final minutes = differenceInMinutes % 60;
//     return '$hours hours $minutes minutes';
//   }


//   void setSelectedStartTime(TimeOfDay newTime) {
//   setState(() {
//     startBreakTime = newTime;
//   });
//   }

//   void setSelectedEndTime(TimeOfDay newTime) {
// setState(() {
//   endBreakTime = newTime;
// });
//   }


//   void calculateBreakDuration() {
//     if (kDebugMode) {
//       print('difffffffff is 1111  $breakDuration ');
//     }
//     if (startBreakTime != null && endBreakTime != null) {
//       final startTime =
//       DateTime(1, 1, 1, startBreakTime.hour, startBreakTime.minute);
//       final endTime = DateTime(1, 1, 1, endBreakTime.hour, endBreakTime.minute);
//       final difference = endTime.difference(startTime);
//       breakDuration = difference.toString();

//       if (kDebugMode) {
//         print('difffffffff is 1111  $breakDuration ');
//       }
//     } else {
//       breakDuration = '';
//     }
//   }
//   /// 

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           width: 64,
//           child: CustomTextFormField2(
//             initialValue: widget.initialValue.hour.toString().padLeft(2, "0"),
//             // onChange: updateHours,
//             controller: startBreakControllerHour,
//             onChange: (v) {},
//             onTap: () {
//               showTimePicker(
//                       context: context,
//                       initialTime: widget.isEndbreak == true
//                           ? endBreakTime
//                           : startBreakTime)
//                   .then((selectedTime) {
//                 if (selectedTime != null) {
//                   if (widget.isEndbreak != true) {
//                     setSelectedStartTime(selectedTime);

//                     calculateBreakDuration();
//                     startBreakControllerHour.text = startBreakTime.hour
//                             .toString()
//                             .padLeft(2, "0");
//                   } else {
//                     setSelectedEndTime(selectedTime);
//                     startBreakControllerHour.text = startBreakTime.hour
//                             .toString()
//                             .padLeft(2, "0");
//                   }
//                 }
//               });
//             },
//             // inputFormatters: [
//             //   FilteringTextInputFormatter.digitsOnly,
//             //   TextInputFormatter.withFunction((oldValue, newValue) {
//             //     final hours = int.parse(newValue.text);
//             //     if (hours > 23) return oldValue;
//             //     return newValue.copyWith(
//             //         text: hours.toString().padLeft(2, "0"),
//             //         selection: const TextSelection.collapsed(offset: 2));
//             //   }),
//             //   LengthLimitingTextInputFormatter(2),
//             // ],
//           ),
//         ),
//         const SizedBox(width: 4),
//         Text(
//           ":",
//           style: TextStyle(
//             fontSize: 24.sp,
//             fontWeight: FontWeight.bold,
//             height: 1,
//           ),
//         ),
//         const SizedBox(width: 4),
//         SizedBox(
//           width: 64,
//           child: CustomTextFormField2(
//               initialValue:
//                   widget.initialValue.minute.toString().padLeft(2, "0"),
//               controller: startBreakControllerHourMin,
//               onChange: (v) {},
//               onTap: () {
//                 showTimePicker(
//                         context: context,
//                         initialTime:
//                             startBreakTime)
//                     .then((selectedTime) {
//                   if (selectedTime != null) {
//                     setSelectedStartTime(selectedTime);
//                     calculateBreakDuration();

//                     startBreakControllerHourMin.text = startBreakTime.minute
//                             .toString()
//                             .padLeft(2, "0");
//                   }
//                 });
//               }
//               ),
//         ),
//       ],
//     );
//   }
// }

// class OptionsSheetItem {
//   final String label;
//   final OptionVariant variant;
//   final Alignment alignment;
//   final Function()? action;

//   const OptionsSheetItem({
//     required this.label,
//     this.action,
//     this.variant = OptionVariant.normal,
//     this.alignment = Alignment.center,
//   });
// }

// class _OptionsSheet extends StatelessWidget {
//   const _OptionsSheet({Key? key, required this.options}) : super(key: key);

//   final List<OptionsSheetItem> options;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.end,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: [
//                   ...options.mapIndexed((i, option) => InkWell(
//                         onTap: option.action == null
//                             ? null
//                             : () {
//                                 option.action?.call();
//                                 Navigator.pop(context);
//                               },
//                         child: Container(
//                           height: 56,
//                           alignment: option.alignment,
//                           decoration: BoxDecoration(
//                             border: i == 0
//                                 ? null
//                                 : const Border(
//                                     top: BorderSide(color: TDMColors.grey300)),
//                           ),
//                           child: Opacity(
//                             opacity: option.action == null ? 0.6 : 1,
//                             child: Text(
//                               option.label,
//                               style: TextStyle(
//                                 color: option.variant == OptionVariant.danger
//                                     ? TDMColors.kErrorBackgroundColor
//                                     : option.variant == OptionVariant.primary
//                                         ? TDMColors.kPrimaryLightColor
//                                         : null,
//                                 fontSize: 16.sp,
//                               ),
//                             ),
//                           ),
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             const _OptionTile(
//               label: "Cancel",
//               variant: OptionVariant.primary,
//               alignment: Alignment.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// enum OptionVariant { primary, danger, normal }

// class _OptionTile extends StatelessWidget {
//   const _OptionTile({
//     Key? key,
//     required this.label,
//     this.variant = OptionVariant.normal,
//     this.alignment = Alignment.centerLeft,
//   }) : super(key: key);

//   final String label;
//   final OptionVariant variant;
//   final AlignmentGeometry alignment;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: alignment,
//       height: 56,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: variant == OptionVariant.danger
//               ? TDMColors.kErrorBackgroundColor
//               : variant == OptionVariant.primary
//                   ? TDMColors.kPrimaryLightColor
//                   : null,
//           fontSize: 16.sp,
//         ),
//       ),
//     );
//   }
// }
