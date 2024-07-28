import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget{
  final String title;
  final void Function()? onPressed;
  final double? borderRadius;
  final bool isButton;
  final bool isLoading;

  const SectionTitle({super.key, this.onPressed, this.borderRadius, this.isLoading = false, required this.title, this.isButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            title,
            style:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          isButton ? Container(
            height: 30,
            width: 80,
            child: ElevatedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  elevation: 1,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'WokSans',
                  ),
                  backgroundColor: Colors.black,
                  padding:
                  const EdgeInsets.symmetric(vertical: 6.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
                  ),
                  minimumSize:  const Size(10, 30),
                  maximumSize:  const Size(10, 30),
                  side: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                child: const Text(
                  "Load More",
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.backgroundColor
                  ),
                )),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
