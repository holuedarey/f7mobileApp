import 'package:f7apparel_mobile/features/cart/cart.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/shop.dart';
import 'package:f7apparel_mobile/features/homepage/presentation/home_page.dart';
import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/body.dart';

import '../../../../blocs/bottom_navigation/bottom_navigation_bloc.dart';
import '../../../../widgets/asset_icon.dart';

class BottomNavbarIndexPage extends StatelessWidget {
  const BottomNavbarIndexPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          throw "";
        },
        child: const BottomNavbarManager());
  }
}

class BottomNavbarManager extends StatefulWidget {
  const BottomNavbarManager({
    Key? key,
  }) : super(key: key);

  @override
  BottomNavbarManagerState createState() => BottomNavbarManagerState();
}

class BottomNavbarManagerState extends State<BottomNavbarManager>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;

  BottomNavigationBloc? bottomNavigationBloc;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    bottomNavigationBloc = BottomNavigationBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (context) =>
              //BottomNavigationBloc()
              bottomNavigationBloc!..add(OpenHomeTabEvent()),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<BottomNavigationBloc, BottomNavigationState>(
              listener: (context, state) {
            if (kDebugMode) {
              print('this event is  navbar state  $state');
            }
            setState(() {
              if (state is OpenHomeTabState) {
                selectedIndex = 0;
              } else if (state is OpenWalletTabState) {
                selectedIndex = 1;
              } else if (state is OpenCreateTabState) {
                selectedIndex = 2;
              } else if (state is OpenExploreTabState) {
                selectedIndex = 3;
              } else if (state is OpenMessagesTabState) {
                selectedIndex = 4;
              }
            });
          }),
        ],
        child: Scaffold(
          body: getBody(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.secondary,
            unselectedLabelStyle: const TextStyle(fontSize: 8),
            currentIndex: selectedIndex,
            selectedIconTheme: const IconThemeData(color: AppColors.secondary),
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bag),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'Account',
              ),
            ],
            onTap: (int index) {
              onTapHandler(index);
            },
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    if (selectedIndex == 0) {
      return  const DashboardBody();
    } else if (selectedIndex == 1) {
      return const ShopBody();
    } else if (selectedIndex == 2) {
      return const CartPage();
    } else if (selectedIndex == 3) {
      return const WishListScreen();
    } else if (selectedIndex == 4) {
      return  const AccountScreen();
    } else {
      return  const DashboardBody();
    }
  }

  void onTapHandler(int index) {
    switch (index) {
      case 0:
        bottomNavigationBloc!.add(OpenHomeTabEvent());
        break;
      case 1:
        bottomNavigationBloc!.add(OpenWalletTabEvent());
        break;
      case 2:
        bottomNavigationBloc!.add(OpenCreateTabEvent());
        break;
      case 3:
        bottomNavigationBloc!.add(OpenExploreTabEvent());
        break;
      case 4:
        bottomNavigationBloc!.add(OpenMessagesTabEvent());
        break;
      default:
    }
  }

  @override
  bool get wantKeepAlive => true;
}
