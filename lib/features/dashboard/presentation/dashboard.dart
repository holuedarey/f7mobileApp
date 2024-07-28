import 'package:flutter/material.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/body.dart';
import 'package:f7apparel_mobile/features/dashboard/presentation/widgets/sidebar.dart';
import 'package:f7apparel_mobile/myapp.dart';
import 'package:f7apparel_mobile/widgets/asset_icon.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.more_vert),
            );
          }),
        ],
      ),
      drawer: const DashboardSidebar(),
      body: const DashboardBody(),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 8),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedLabelStyle: const TextStyle(fontSize: 8),
        type: BottomNavigationBarType.fixed,
        onTap: (int page) {
          switch (page) {
            case 1:
              Navigator.of(context).pushNamed(Routes.fluidIntakeListRoute);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "grid2"),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "fluid-intake"),
            label: 'Fluid Intake',
          ),
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "shift"),
            label: 'Shift Manager',
          ),
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "sleep"),
            label: 'Sleep Tracker',
          ),
          BottomNavigationBarItem(
            icon: AssetIcon(icon: "diet"),
            label: 'Diet and Food',
          ),
        ],
      ),
    );
  }
}
