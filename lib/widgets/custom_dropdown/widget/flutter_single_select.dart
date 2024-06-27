import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/enum.dart';
import '../utils/flutter_custom_select_item.dart';
import '../utils/utils.dart';
import 'bottom_sheets/type_selector_sheet.dart';

class CustomSingleSelectField<T> extends StatefulWidget
    with TypeBottomSheetSelectorSheet<T> {
  final double? width;
  final String hintTitle;
  final String title;
  final String Function(dynamic value)? itemAsString;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final void Function(dynamic value)? onSelectionDone;
  final T? initialValue;
  final Color selectedItemColor;
  final List<T> items;

  CustomSingleSelectField({
    Key? key,
    required this.items,
    required this.hintTitle,
    required this.title,
    required this.onSelectionDone,
    this.width,
    this.itemAsString,
    this.decoration,
    this.validator,
    this.initialValue,
    this.selectedItemColor = Colors.redAccent,
  }) : super(key: key);

  @override
  State<CustomSingleSelectField> createState() =>
      _CustomSingleSelectFieldState();
}

class _CustomSingleSelectFieldState<T>
    extends State<CustomSingleSelectField<T>> {
  final TextEditingController _controller = TextEditingController();
  T? selectedItem;

  @override
  void initState() {
    selectedItem = widget.initialValue;
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
  @override
  void didChangeDependencies() {
    // _controller.text = _selectedItemAsString(selectedItem);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = _selectedItemAsString(selectedItem);
    });


    return GestureDetector(
      onTap: () async {
        Map<String, List<T>?> result = await TypeBottomSheetSelectorSheet<T>().customBottomSheet(
          buildContext: context,
          selectedItemColor: widget.selectedItemColor,
          initialSelection: selectedItem != null ? [selectedItem as T] : [],
          buttonType: CustomDropdownButtonType.singleSelect,
          headerName: widget.title,
          dropdownItems: _getDropdownItems(list: widget.items),
        );

        if (result[selectedList] != null) {
          if (widget.onSelectionDone != null) {
            widget.onSelectionDone!(result[selectedList]!.first);
          }
          selectedItem = result[selectedList]!.first;
          _controller.text = _selectedItemAsString(selectedItem);
          setState(() {});
        }
      },
      child: SizedBox(
        width: widget.width ?? double.infinity,
        child: TextFormField(
          controller: _controller,
          readOnly: true,
          enabled: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,

          style: defaultTextStyle(
            fontSize: 16,
          ),
          decoration: widget.decoration ??
              InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 4.0),
                errorBorder: inputFieldBorder(color: errorColor),
                errorMaxLines: 2,
                errorStyle: defaultTextStyle(
                  color: errorColor,
                  fontSize: 11,
                ),
                floatingLabelStyle:
                    defaultTextStyle(color: labelColor, fontSize: 14),
                hintText: widget.hintTitle,
                labelText: widget.title,
                hintStyle: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),
                labelStyle: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 24,
                ),
                suffixIconColor: Colors.black,
                enabledBorder: inputFieldBorder(color: Colors.blueGrey),
                border: inputFieldBorder(color: Colors.blueGrey),
                focusedBorder: inputFieldBorder(color: Colors.blueGrey),
                focusedErrorBorder: inputFieldBorder(color: errorColor),
              ),
        ),
      ),
    );
  }

  String _selectedItemAsString(T? data) {
    if (data == null) {
      return "";
    } else if (widget.itemAsString != null) {
      return widget.itemAsString!(data);
    } else {
      return data.toString();
    }
  }

  List<CustomMultiSelectDropdownItem<T>> _getDropdownItems(
      {required List<T> list}) {
    List<CustomMultiSelectDropdownItem<T>> myList =
        <CustomMultiSelectDropdownItem<T>>[];
    for (T myItem in list) {
      myList.add(CustomMultiSelectDropdownItem(myItem, myItem.toString()));
    }
    return myList;
  }
}
