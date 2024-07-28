import 'package:flutter/material.dart';

import 'spacing.dart';

class BigButton extends StatelessWidget {
  final Color textColor;
  final Color? backgroundColor;
  final Color? borderOutlineColor;
  final String? text;
  final Widget? prefix, suffix, child;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double? elevation;
  final double? width;
  final double? height;
  final bool isLoading;

  const BigButton(
      {Key? key,
      this.textColor = Colors.white,
      this.backgroundColor,
      this.borderOutlineColor,
      this.text,
      this.child,
      this.prefix,
      this.suffix,
      this.elevation,
      this.onPressed,
      this.padding,
      this.isLoading= false, required this.borderRadius,  this.width, this.height})
      : assert(child != null || text != null),
        assert(child == null || text == null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // var hslColor = HSLColor.fromColor(backColor);
    // var hslTextColor = HSLColor.fromColor(textColor2);
    var backColor = backgroundColor ?? Theme.of(context).primaryColor;
    var outlineColor = borderOutlineColor ?? Theme.of(context).primaryColor;
    var textColor2 = textColor;
    return Row(
      children: [
        Expanded(
          child:
          ElevatedButton(

            style: OutlinedButton.styleFrom(
              elevation:elevation ?? 0,
              textStyle: TextStyle(
                color: textColor2,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'WokSans',
              ),
              primary: textColor2,
              backgroundColor: backColor,
              padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius?? 8.0),
              ),
              minimumSize:  Size(width ?? 320, height ?? 62),
              maximumSize:  Size(width ?? 320, height ?? 62),
              side:  BorderSide(color: outlineColor, width: 1.0, style: BorderStyle.solid),
            ),
            onPressed: isLoading ? null : onPressed,
            child: isLoading
                ? SizedBox(
                    height: 14,
                    width: 14,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(textColor2),
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (prefix != null) prefix!,
                      if (prefix != null) const HorizontalSpace(size: 8.8),
                      if (text != null)
                        Text(
                          text!,
                          style: TextStyle(fontSize: 20.0, color: textColor),
                        )
                      else
                        child!,
                      if (suffix != null) const HorizontalSpace(size: 1.8),
                      if (suffix != null) suffix!,
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}

class SmallButton extends StatelessWidget {
  final Color textColor;
  final Color? backgroundColor;
  final String? text;
  final Widget? prefix, suffix, child;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;

  const SmallButton(
      {Key? key,
      this.textColor: Colors.white,
      this.backgroundColor,
      this.text,
      this.child,
      this.prefix,
      this.suffix,
      this.onPressed,
      this.padding,
      this.isLoading: false})
      : assert(child != null || text != null),
        assert(child == null || text == null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    var backColor = backgroundColor ?? Colors.blue;
    var textColor2 = textColor;
    return

      ElevatedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        textStyle: TextStyle(
          color: textColor2,
          fontWeight: FontWeight.w600,
        ),
        primary: textColor2,
        backgroundColor: backColor,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // minimumSize: const Size(150, 56),
        minimumSize: const Size(200, 50),
        maximumSize: const Size(200, 50),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(textColor2),
                strokeWidth: 2,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefix != null) prefix!,
                if (prefix != null) const HorizontalSpace(size: 1.8),
                if (text != null)
                  Text(
                    text!,
                    style: const TextStyle(fontSize: 14.0),
                  )
                else
                  child!,
                if (suffix != null) const HorizontalSpace(size: 1.8),
                if (suffix != null) suffix!,
              ],
            ),
    );
  }
}


class AuthButton extends StatelessWidget {
  final Color textColor;
  final Color? backgroundColor;
  final String? text;
  final Widget? prefix, suffix, child;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? boderRadius;
  final double? elevation;
  final bool isLoading;

  const AuthButton(
      {Key? key,
        this.textColor = Colors.white,
        this.backgroundColor,
        this.text,
        this.child,
        this.prefix,
        this.suffix,
        this.elevation,
        this.onPressed,
        this.padding,
        this.isLoading: false, required this.boderRadius})
      : assert(child != null || text != null),
        assert(child == null || text == null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // var hslColor = HSLColor.fromColor(backColor);
    // var hslTextColor = HSLColor.fromColor(textColor2);
    var backColor = backgroundColor ?? Theme.of(context).primaryColor;
    var textColor2 = textColor;
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: OutlinedButton.styleFrom(
              elevation:elevation ?? 0,
              textStyle: TextStyle(
                color: textColor2,
                fontWeight: FontWeight.w800,
              ),
              primary: textColor2,
              backgroundColor: backColor,
              padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0),


              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(boderRadius?? 8.0),
              // ),
              minimumSize: const Size(300, 55),
              maximumSize: const Size(300, 55),
            ),
            onPressed: isLoading ? null : onPressed,
            child: isLoading
                ? SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(textColor2),
                strokeWidth: 2,
              ),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefix != null) prefix!,
                if (prefix != null) const HorizontalSpace(size: 8.8),
                if (text != null)
                  Text(
                    text!,
                    style: const TextStyle(fontSize: 20.0),
                  )
                else
                  child!,
                if (suffix != null) const HorizontalSpace(size: 1.8),
                if (suffix != null) suffix!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}




class OutlineBigButton extends StatelessWidget {
  final Color textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? text;
  final Widget? prefix, suffix, child;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? boderRadius;
  final double? elevation;
  final double? width;
  final double? height;
  final bool isLoading;

  const OutlineBigButton(
      {Key? key,
        this.textColor = Colors.white,
        this.backgroundColor,
        this.borderColor,
        this.text,
        this.child,
        this.prefix,
        this.suffix,
        this.elevation,
        this.onPressed,
        this.padding,
        this.isLoading= false, required this.boderRadius,  this.width, this.height})
      : assert(child != null || text != null),
        assert(child == null || text == null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // var hslColor = HSLColor.fromColor(backColor);
    // var hslTextColor = HSLColor.fromColor(textColor2);
    var backColor = backgroundColor ?? Theme.of(context).primaryColor;
    var textColor2 = textColor;
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: OutlinedButton.styleFrom(
              elevation:elevation ?? 0,
              textStyle: TextStyle(
                color: backgroundColor,
                fontWeight: FontWeight.w800,
              ),
              primary: textColor2,
              backgroundColor: backColor,
              padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(boderRadius?? 8.0),
                  side: BorderSide(
                    color: borderColor ?? Colors.white,
                    width: 2.0,
                  )
              ),
              minimumSize:  Size(width ?? 320, height ?? 62),
              maximumSize:  Size(width ?? 320, height ?? 62),
            ),
            onPressed: isLoading ? null : onPressed,
            child: isLoading
                ? SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(textColor2),
                strokeWidth: 2,
              ),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefix != null) prefix!,
                if (prefix != null) const HorizontalSpace(size: 8.8),
                if (text != null)
                  Text(
                    text!,
                    style: TextStyle(fontSize: 20.0, color: textColor),
                  )
                else
                  child!,
                if (suffix != null) const HorizontalSpace(size: 1.8),
                if (suffix != null) suffix!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}