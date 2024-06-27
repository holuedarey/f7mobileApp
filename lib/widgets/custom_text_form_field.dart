import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:f7apparel_mobile/common/configurations/tdm_strings.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.label,
    this.hintText,
    this.onChange,
    this.initialValue,
    this.validator,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.suffix,
    this.autovalidateMode,
    this.autoDisposeController = true,
    this.keyboardType,
    this.readOnly = false,
    this.expands = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.autofillHints,
    this.inputFormatters,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final ValueChanged<String>? onChange;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String obscuringCharacter;
  final Widget? suffix;
  final AutovalidateMode? autovalidateMode;
  final bool autoDisposeController;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool expands;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? autofillHints;

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.initialValue ?? '');
    if (widget.controller != null && widget.initialValue != null) {
      controller!.text = widget.initialValue!;
    }
  }

  // @override
  // void dispose() {
  //   if (widget.autoDisposeController == true) {
  //     controller.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label ?? '',
          style: Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          validator: (value) {
            return widget.validator?.call(value);
          },
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          autovalidateMode: widget.autovalidateMode,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChange,
          readOnly: widget.readOnly,
          expands: widget.expands,
          inputFormatters: widget.inputFormatters,
          minLines: widget.expands ? null : widget.minLines,
          maxLines: widget.expands ? null : widget.maxLines,
          maxLength: widget.maxLength,
          autofillHints: widget.autofillHints,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffix: widget.suffix,
            isDense: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}

class CustomTextFormField2 extends StatefulWidget {
  const CustomTextFormField2(
      {Key? key,
      this.controller,
      this.label,
      this.labelText,
      this.hintText,
      this.onChange,
      this.initialValue,
      this.validator,
      this.obscureText = false,
      this.onTap,
      this.obscuringCharacter = '•',
      this.suffix,
      this.prefix,
      this.autovalidateMode,
      this.autoDisposeController = true,
      this.keyboardType,
      this.readOnly = false,
      this.expands = false,
      this.maxLines = 1,
      this.onSaved,
      this.minLines,
      this.maxLength,
      this.autofillHints,
      this.inputFormatters,
      this.padding,
      this.textInputAction,
      this.suffixIcon
      })
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? label;
  final String? hintText;
  final ValueChanged<String>? onChange;
  final String? initialValue;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool obscureText;
  final String obscuringCharacter;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;
  final bool autoDisposeController;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool expands;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? autofillHints;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;


  @override
  CustomTextFormField2State createState() => CustomTextFormField2State();
}

class CustomTextFormField2State extends State<CustomTextFormField2> {
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.initialValue ?? '');
    if (widget.controller != null && widget.initialValue != null) {
      controller!.text = widget.initialValue!;
    }
  }

  // @override
  // void dispose() {
  //   if (widget.autoDisposeController == true) {
  //     controller.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text(widget.label ?? '', style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontSize: context.width(.035), fontWeight: FontWeight.w500, fontFamily: "Work Sans")),
        // const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          validator: (value) {
            return widget.validator?.call(value);
          },
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          autovalidateMode: widget.autovalidateMode,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChange,
          readOnly: widget.readOnly,
          onSaved: widget.onSaved,
          onTap: widget.onTap,
          expands: widget.expands,
          inputFormatters: widget.inputFormatters,
          minLines: widget.expands ? null : widget.minLines,
          maxLines: widget.expands ? null : widget.maxLines,
          maxLength: widget.maxLength,
          autofillHints: widget.autofillHints,
          decoration:
          InputDecoration(
            labelText: widget.labelText ?? '',
            hintText: widget.hintText,
            labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp, fontWeight: FontWeight.w400),
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp, fontWeight: FontWeight.w400),
            suffixIconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            fillColor: Theme.of(context).colorScheme.background,
            filled: true,
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefix,
            isDense: true,
            alignLabelWithHint: true,
            contentPadding: widget.padding ??  EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 22.h),

            // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(co8ntext).colorScheme.inverseSurface, width: .8)),
            // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inverseSurface, width: .8)),
            // // border: const OutlineInputBorder(borderSide: BorderSide(width: .5)),
            // border: OutlineInputBorder(
            //   borderRadius: const BorderRadius.all(Radius.circular(8.0)), borderSide: BorderSide(width: 8, color: Theme.of(context).colorScheme.inverseSurface),
            // ),


            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(
                color: Theme.of(context).colorScheme.inverseSurface,
                width: 1.4,
                style: BorderStyle.solid,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(
                color: Theme.of(context).colorScheme.inverseSurface,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
//                                focusedBorder: focusedBorder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.inverseSurface,
                width: 0.5,
                style: BorderStyle.none,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.inverseSurface,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          style: TextStyle(
            color: const Color(0xdd000000),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: 'Lato',
            fontFamilyFallback: const <String>['OpenSans'],
          ),
        ),
      ],
    );
  }
}



class AmountCustomFormField extends StatefulWidget {
  const AmountCustomFormField(
      {Key? key,
        this.controller,
        this.label,
        this.labelText,
        this.hintText,
        this.onChange,
        this.initialValue,
        this.validator,
        this.obscureText = false,
        this.onTap,
        this.obscuringCharacter = '•',
        this.suffix,
        this.prefix,
        this.autovalidateMode,
        this.autoDisposeController = true,
        this.keyboardType,
        this.readOnly = false,
        this.expands = false,
        this.maxLines = 1,
        this.onSaved,
        this.minLines,
        this.maxLength,
        this.autofillHints,
        this.inputFormatters,
        this.padding,
        this.textInputAction,
        this.suffixIcon
      })
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final String? label;
  final String? hintText;
  final ValueChanged<String>? onChange;
  final String? initialValue;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool obscureText;
  final String obscuringCharacter;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;
  final bool autoDisposeController;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool expands;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? autofillHints;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;


  @override
  AmountCustomFormFieldState createState() => AmountCustomFormFieldState();
}

class AmountCustomFormFieldState extends State<AmountCustomFormField> {
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.initialValue ?? '');
    if (widget.controller != null && widget.initialValue != null) {
      controller!.text = widget.initialValue!;
    }
  }

  // @override
  // void dispose() {
  //   if (widget.autoDisposeController == true) {
  //     controller.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text(widget.label ?? '', style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface, fontSize: context.width(.035), fontWeight: FontWeight.w500, fontFamily: "Work Sans")),
        // const SizedBox(height: 4),
        Expanded(
          child: TextFormField(
            controller: controller,
            validator: (value) {
              return widget.validator?.call(value);
            },
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            autovalidateMode: widget.autovalidateMode,
            keyboardType: widget.keyboardType,
            onChanged: widget.onChange,
            readOnly: widget.readOnly,
            onSaved: widget.onSaved,
            onTap: widget.onTap,
            expands: widget.expands,
            inputFormatters: widget.inputFormatters,
            minLines: widget.expands ? null : widget.minLines,
            maxLines: widget.expands ? null : widget.maxLines,
            maxLength: widget.maxLength,
            autofillHints: widget.autofillHints,

            decoration: InputDecoration(
              labelText: widget.labelText ?? '',
              hintText: widget.hintText,
              labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp, fontWeight: FontWeight.w400),
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14.sp, fontWeight: FontWeight.w400),
              fillColor: Theme.of(context).colorScheme.background,
              filled: true,
              suffix: widget.suffix,
              suffixIcon: widget.suffixIcon,
              prefix: const Text(TDMStrings.symbolNaira),
              prefixIcon: widget.prefix,
              isDense: true,
              alignLabelWithHint: true,
              contentPadding: widget.padding ??  EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
              // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inverseSurface, width: .8)),
              // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.inverseSurface, width: .8)),
              // // border: const OutlineInputBorder(borderSide: BorderSide(width: .5)),
              // border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(Radius.circular(8.0)), borderSide: BorderSide(width: 8, color: Theme.of(context).colorScheme.inverseSurface),
              // ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  width: 0.6,
                  style: BorderStyle.solid,
                ),
              ),
//                                focusedBorder: focusedBorder,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  width: 0.6,
                  style: BorderStyle.solid,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  width: 0.6,
                  style: BorderStyle.solid,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 0.6,
                  style: BorderStyle.solid,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            // style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold),
            style: TextStyle(
              color: const Color(0xdd000000),
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontFamily: 'Poppins',
              fontFamilyFallback: const <String>['Roboto'],
            ),
          ),
        ),
      ],
    );
  }
}
