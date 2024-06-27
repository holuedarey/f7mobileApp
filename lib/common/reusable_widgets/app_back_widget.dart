import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const AppBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? Navigator.of(context).pop,
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
      child: Row(
        children: const [
          Icon(Icons.arrow_back_ios_new, size: 12,),
          Text("Back", style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
