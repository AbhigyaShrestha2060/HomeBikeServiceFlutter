import 'package:final_assignment/features/inventory/presentation/view/inventory_view.dart';
import 'package:final_assignment/features/profile/presentation/view/profile_view.dart';
import 'package:final_assignment/features/service/presentation/view/service_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'dashboard_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final List<Widget> _lstViews = [
    const DashboardView(),
    const InventoryView(),
    const ServiceCategoryView(),
    const ProfileView(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lstViews[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue.withOpacity(0.1),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.dashboard,
                  text: 'Dashboard',
                  iconActiveColor: Colors.blue,
                  textColor: Colors.blue,
                ),
                GButton(
                  icon: Icons.inventory,
                  text: 'Inventory',
                  iconActiveColor: Colors.green,
                  textColor: Colors.green,
                ),
                GButton(
                  icon: Icons.restore,
                  text: 'Service',
                  iconActiveColor: Colors.orange,
                  textColor: Colors.orange,
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  iconActiveColor: Colors.purple,
                  textColor: Colors.purple,
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
