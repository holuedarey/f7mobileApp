import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  final ValueChanged<String>? onCompleted;
  final double padding;
    const CustomPinCodeField({Key? key, this.onCompleted, this.padding = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PinTheme _createPinTheme(BuildContext context, Color? color) {
      return PinTheme(
        shape: PinCodeFieldShape.box,
        borderWidth: 1.0,
        fieldHeight: 55.h,
          fieldWidth: 55.w,
         borderRadius: BorderRadius.circular(8.0),
        inactiveColor: const Color(0xdd616161),
        errorBorderColor: color,
        activeColor: color,
        selectedColor: color,
        activeFillColor: const Color(0xffffffff),
        selectedFillColor: const Color(0xffffffff),
        inactiveFillColor: const Color(0xffffffff),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        showCursor: true,
        keyboardType: TextInputType.number,
        pinTheme: _createPinTheme(context, const Color(0xdd616161)),
        cursorColor: Theme.of(context).primaryColor,
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          color: Theme.of(context).primaryColor,
        ),
        enableActiveFill: true,
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        onCompleted: onCompleted,
        onChanged: (value) {
          print(value);
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
