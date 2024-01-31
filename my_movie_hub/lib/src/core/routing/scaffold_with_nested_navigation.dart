import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_kit/ui_kit.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.black2,
        selectedLabelStyle: AppTextStyle.bodySmall,
        unselectedLabelStyle: AppTextStyle.bodySmall,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            label: 'Watchlist',
            icon: Icon(Icons.visibility_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'A',
            icon: Icon(Icons.ac_unit),
          ),
          BottomNavigationBarItem(
            label: 'B',
            icon: Icon(Icons.access_alarm),
          ),
        ],
      ),
    );
  }
}
