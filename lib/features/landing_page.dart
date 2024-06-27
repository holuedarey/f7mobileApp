import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:f7apparel_mobile/myapp.dart';

import '../widgets/app_images.dart';
import '../widgets/buttons.dart';
import '../widgets/spacing.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        color: Colors.black,
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: -5,
                  bottom: 50,
                  right: 8,
                  left: 50,
                  child: Image.asset(
                    AppImages.splash,
                    fit: BoxFit.cover,
                  )),
              Positioned(
                bottom: 235,
                right: 50,
                left: 50,
                child: Text(
                  "Trusted",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Positioned(
                bottom: 198,
                right: 50,
                left: 50,
                child: Text(
                  "Deal Maker",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0,
                  ),
                ),
              ),
              // VerticalSpace(size: deviceHeight * 0.0859),
              Positioned(
                bottom: 110,
                right: 105,
                left: 105,
                child: BigButton(
                  text: "Sign in",
                  backgroundColor: theme.primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.loginPageRoute);
                    return;
                  },
                  borderRadius: 16.0,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 44.0.h,left: 10.0.w,right: 10.0.w),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0).w,
                            child: Text(
                              "...",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.sp,
                              ),
                            ),
                          ),
                        ),
                        const HorizontalSpace(size: 16),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0).w,
                            child: GestureDetector(
                              child: Text(
                                "Sign Up",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(Routes.signupInvitationPageRoute);
                                return;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
