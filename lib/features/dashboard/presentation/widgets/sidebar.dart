import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f7apparel_mobile/common/theme/colors.dart';
import 'package:f7apparel_mobile/widgets/asset_icon.dart';

import '../../../../blocs/authentication/authentication_bloc.dart';
import '../../../../blocs/authentication/authentication_event.dart';
import '../../../../common/system_util.dart';
import '../../../../myapp.dart';

class _DashboardTile extends StatelessWidget {
  const _DashboardTile(
      {Key? key, required this.title, this.icon, this.trailing,  required this.onPressed})
      : super(key: key);

  final String title;
  final String? icon;
  final Widget? trailing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPressed,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        child: Row(
          children: [
            AssetIcon(icon: icon ?? "home"),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

class DashboardSidebar extends StatelessWidget {
  const  DashboardSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      color: Colors.white,
      child: Column(
        children: [
          const _SidebarHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 36),
              children: [
                 _DashboardTile(title: 'Home',onPressed: (){
                   launchNewScreenWithNewTask(context, Routes.dashboardRoute);

                 },),
                 _DashboardTile(title: 'Daily Journal', icon: 'journal',onPressed: (){
                   launchNewScreenWithNewTask(context, Routes.manageJournalRoute);
                 },),
                _DashboardTile(
                  title: 'Fluid Intake',
                  icon: 'fluid-intake',
                  trailing: Container(
                    height: 24,
                    constraints: const BoxConstraints(minWidth: 24),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: TDMColors.kOrange,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      '20',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onPressed: (){
                    launchNewScreenWithNewTask(context, Routes.fluidIntakeListRoute);
                  },
                ),
                 _DashboardTile(title: 'Activity', icon: 'activity-heart', onPressed: () {  },),
                 _DashboardTile(
                  title: 'Financial Wellbeing',
                  icon: 'financial-wellbeing',
                     onPressed: () {  }
                ),
                 _DashboardTile(
                    title: 'Mental Health', icon: 'mental-health',onPressed: () {  }),
                 _DashboardTile(
                    title: 'Alcohol Tracker', icon: 'cocktail2', onPressed: () {}),
                const Divider(),
                 _DashboardTile(title: 'Settings', icon: 'settings-01',onPressed: () {  }),
                 _DashboardTile(title: 'Help Centre', icon: 'help-circle',onPressed: () {  }),
                 _DashboardTile(title: 'Logout', icon: 'log-out-01',onPressed: () {
                   AuthenticationBloc bloc =
                   BlocProvider.of<AuthenticationBloc>(context, listen: false);
                   bloc.add(AuthenticationEventSignedOut());
                 }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarHeader extends StatelessWidget {
  const _SidebarHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SizedBox(
              height: 190,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: DecoratedBox(
                        position: DecorationPosition.foreground,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 36,
                          backgroundImage: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Daniel Smith',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    // SizedBox(height: 10),
                    const Text(
                      'daniel.smith@hampshire.pnn.police.uk',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              child: IconButton(
                // visualDensity: VisualDensity.compact,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
