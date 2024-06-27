import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import 'btn_circular_loading_indicator.dart';

class CustomContinueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isActive;
  final Color bgColor;
  final Color? textColor;
  final double? textSize;
  final double? topPadding;
  final double? sidePadding;

  const CustomContinueButton(
      {Key? key,
      required this.onPressed,
      this.title = 'Continue',
      this.sidePadding,
      this.topPadding,
      this.textColor,
      this.textSize,
      this.bgColor = TDMColors.buttonColor,
      this.isActive = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sidePadding ?? 2, vertical: topPadding ?? 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: bgColor,
            shape: RoundedRectangleBorder(
                side: isActive ? BorderSide(color: bgColor) : BorderSide.none,
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onPressed: isActive ? onPressed : null,
          child: isActive
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .016),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: textColor ?? TDMColors.kWhiteCardColor,
                        fontSize: textSize ?? 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .025),
                  child: const ButtonCircularLoadingIndicator(),
                ),
        ),
      ),
    );
  }
}
