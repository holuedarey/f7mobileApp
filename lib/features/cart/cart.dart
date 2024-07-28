import 'package:f7apparel_mobile/features/common/app_bar.dart';
import 'package:f7apparel_mobile/features/common/basket_icon.dart';
import 'package:f7apparel_mobile/widgets/buttons.dart';
import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const AppBarHeader(isLogo: false, title: "Cart"),
          actions: const [BasketIcon()],
        ),
        // drawer: const DashboardSidebar(),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFEFEFEF),
          ),
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFEFEFEF),
                // border: Border.all(color: Colors.grey.shade200)
              ),
              child: Column(
                children: [
                  ...List.generate(
                      2,
                      (index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 169.sp,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE6E6E6),
                                border:
                                    Border.all(color: const Color(0xFFE6E6E6)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/images/onboarding/onboard_1.png",
                                    width: 150,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      const Text("Zegna Suede Zip-Up Jacket",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Color(0Xff000000),
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12)),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      const Text("₦2,084,375.00",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Color(0Xff000000),
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12)),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            width: 40.sp,
                                            height: 40.sp,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xFFFFFFFF)),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(100))),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 16,
                                                color: Color(0xFF7A7A7A),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            child: Text("2",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                        const Color(0Xff000000),
                                                    fontFamily: 'OpenSans',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.sp)),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            width: 40.sp,
                                            height: 40.sp,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xFFFFFFFF)),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(100))),
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.add,
                                                size: 16,
                                                color: Color(0xFF7A7A7A),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 40.sp,
                                  height: 40.sp,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      border: Border.all(
                                          color: const Color(0xFFFFFFFF)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100))),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      size: 16,
                                      color: Color(0xFF7A7A7A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270.sp,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      border: Border.all(color: const Color(0xFFDCDCDC)),
                      borderRadius: const BorderRadius.all(
                            Radius.circular(6))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cart Totals",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0Xff000000),
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("Sub Total",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0Xff000000),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp)),
                            const Spacer(),
                            Text("₦5,084,375.00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0Xff000000),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("Shipping",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0Xff000000),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp)),
                            const Spacer(),
                            Text("Free shipping",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.brandBtn,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp)),
                          ],
                        ),
                        const VerticalDivider(color: Color(0XFFDBDBDB),),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text("Total",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0Xff000000),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp)),
                            const Spacer(),
                            Text("₦ 5,084,375.00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0Xff000000),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp)),
                          ],
                        ),
                        const VerticalSpace(size: 15,),
                        const BigButton(
                          elevation: 4.0,
                          text: "CHECKOUT",
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          onPressed: null,
                          borderRadius: 6.0,
                          borderOutlineColor: Colors.black,
                        ),
                         const Spacer()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
