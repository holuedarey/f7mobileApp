import 'package:f7apparel_mobile/myapp.dart';
import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:flutter/material.dart';

class BasketIcon extends StatefulWidget {
  const BasketIcon({super.key});

  @override
  State<BasketIcon> createState() => _BasketIconState();
}

class _BasketIconState extends State<BasketIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(Routes.cart);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0, top: 16),
        child: const Badge(
          label: Text('2'),
          largeSize: 15,
          backgroundColor:  AppColors.brandBtn,
          textStyle: TextStyle(fontSize: 10),
          child: Icon(Icons.shopping_bag_outlined),
        ),
      ),
    );
  }
}
