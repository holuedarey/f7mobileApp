import 'package:f7apparel_mobile/features/cart/cart.dart';
import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildScreens() {
      return const [
        Screen1(),
        ShopScreen(),
        CartPage(),
        WishListScreen(),
        AccountScreen(),
      ];
    }


    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: AppColors.secondary,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.cart),
          title: ("Shop"),
          activeColorPrimary: AppColors.secondary,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.bag),
          title: ("Bag"),
          activeColorPrimary: AppColors.secondary,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.heart),
          title: ("Wishlist"),
          activeColorPrimary: AppColors.secondary,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person),
          title: ("Account"),
          activeColorPrimary: AppColors.secondary,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        bottomScreenMargin: 3,

        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(2.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text("Home Page", textAlign: TextAlign.center,  style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.primary_dark, fontSize: 20),),
        ),
      ),
    );
  }
}

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text("Shop Page", textAlign: TextAlign.center,  style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.primary_dark,  fontSize: 20),),
        ),
      ),
    );
  }
}

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text("WishList Page", textAlign: TextAlign.center,  style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.primary_dark,  fontSize: 20),),
        ),
      ),
    );
  }
}


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text("Account Page", textAlign: TextAlign.center,  style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.primary_dark,  fontSize: 20),),
        ),
      ),
    );
  }
}