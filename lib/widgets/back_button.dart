import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  /// An override callback to perform instead of the default behavior which is
  /// to pop the [Navigator].
  ///
  /// It can, for instance, be used to pop the platform's navigation stack
  /// via [SystemNavigator] instead of Flutter's [Navigator] in add-to-app
  /// situations.
  ///
  /// Defaults to null.
  final VoidCallback? onPressed;

  const CustomBackButton({Key? key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          children: [
            const Expanded(
              child: Icon(
                Icons.arrow_back_ios_new,
                color:Color(0Xff3E4352),
                size: 12,
                // color: Colors.white,
              ),
            ),
            Expanded(
              child: Text('Back',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall),
            ),
          ],
        ),
      ),
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
        // else {
        //   Navigator.maybePop(context);
        // }
      },
    );
  }
}
