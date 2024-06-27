import 'package:f7apparel_mobile/common/middlewares/storage_helper.dart';
import 'package:f7apparel_mobile/features/login/presentation/login_page.dart';
import 'package:f7apparel_mobile/features/onboarding/dot_indicator.dart';
import 'package:f7apparel_mobile/features/onboarding/onboarding_page.dart';
import 'package:f7apparel_mobile/models/onboarding/onboard.dart';
import 'package:f7apparel_mobile/widgets/buttons.dart';
import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {

     Future<dynamic> navigateSignUp() async {
      var pushReplacement = Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      if (StorageHelper.getBoolean('isFirstTime', false) == false) {
          StorageHelper.setBoolean('isFirstTime', true);
          pushReplacement;
      } else {
        pushReplacement;
      }
    }
     Future<dynamic> navigateLogin() async {
      var pushReplacement = Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      if (StorageHelper.getBoolean('isFirstTime', false) == false) {
          StorageHelper.setBoolean('isFirstTime', true);
          pushReplacement;
      } else {
        pushReplacement;
      }
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      onboardData.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),
                ],
              ),

              Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: onboardData.length,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => OnboardingPage(
                          title: onboardData[index].title,
                          description: onboardData[index].description,
                          image: onboardData[index].image,
                        )),
              ),
              Column(
                children: [
                  BigButton(
                    borderRadius: 9,
                    textColor: AppColors.greyBlack,
                    backgroundColor: AppColors.backgroundColor,
                    text: "Create an Account",
                    borderOutlineColor: Colors.black12,
                     onPressed: () => navigateSignUp(),
                  ),
                  const VerticalSpace(
                    size: 8,
                  ),
                  BigButton(
                    borderRadius: 9,
                    textColor: AppColors.backgroundColor,
                    backgroundColor: AppColors.grey_2,
                    text: "Sign in",
                    borderOutlineColor: Colors.black12,
                    onPressed: () => navigateLogin(),
                  ),
                  const VerticalSpace(
                    size: 8,
                  ),
                  Text("Continue as guest",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.backgroundColor)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
