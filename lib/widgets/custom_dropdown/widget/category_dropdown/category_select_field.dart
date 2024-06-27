import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:f7apparel_mobile/widgets/custom_dropdown/flutter_custom_selector.dart';
import 'package:f7apparel_mobile/widgets/custom_dropdown/widget/category_dropdown/type_bottom_sheet.dart';


class CategoryCustomSingleSelectField<T> extends StatefulWidget
    with CategoryBottomSheet<T> {
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

  CategoryCustomSingleSelectField({
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
  State<CategoryCustomSingleSelectField> createState() =>
      _CategoryCustomSingleSelectFieldState();
}

class _CategoryCustomSingleSelectFieldState<T> extends State<CategoryCustomSingleSelectField<T>> {
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
        Map<String, List<T>?> result = await CategoryBottomSheet<T>().customBottomSheet(
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
          if (!mounted) return;
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
