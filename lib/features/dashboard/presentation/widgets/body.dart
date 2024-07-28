import 'package:f7apparel_mobile/features/common/basket_icon.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/arrival.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/feature_product.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/recent_view_product.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/section_title.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/top_brands.dart';
import 'package:f7apparel_mobile/global_bloc_provider.dart';
import 'package:f7apparel_mobile/widgets/colors.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/banner_section.dart';
import 'package:f7apparel_mobile/models/secret/secret_model.dart';

import '../../../../common/middlewares/tdm_storage.dart';
import '../../../common/app_bar.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IconsCubit()..fetchIconsRequest(),
      child: const DashboardWidget(),
    );
  }
}

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  String? firstName;

  void getUserData() async {
    final HantspolStorage hantspolStorage = HantspolStorage.getInstance();
    UserDataResponse? userDataResponse = await hantspolStorage.getUserData();
    setState(() {
      firstName = userDataResponse?.user.userDisplayName;
    });
  }

  @override
  initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const AppBarHeader(isLogo : true, title: ""),
          centerTitle: false,
          actions: const [ BasketIcon() ],
        ),
        // drawer: const DashboardSidebar(),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE0E0E0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                BannerSection(),
                VerticalSpace(size: 5),
                SectionTitle(title: "New Arrivals", isButton: true),
                ArrivalSection(),
                VerticalSpace(size: 5),
                SectionTitle(title: "Featured Products"),
                FeaturedProducts(),
                VerticalSpace(size: 5),
                SectionTitle(title: "Top Brands"),
                TopBrandSection(),
                VerticalSpace(size: 5),
                SectionTitle(title: "Recently Viewed"),
                RecentViewProducts(),
              ],
            ),
          ),
        ));
  }
}