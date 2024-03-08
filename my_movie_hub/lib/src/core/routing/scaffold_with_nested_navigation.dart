import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_kit/ui_kit.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSpaces.s8),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSpaces.s20),
            topRight: Radius.circular(AppSpaces.s20),
            bottomLeft: Radius.circular(AppSpaces.s48),
            bottomRight: Radius.circular(AppSpaces.s48),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: ColoredBox(
              color: AppColors.white.withOpacity(0.25),
              child: BottomNavigationBar(
                backgroundColor: AppColors.black.withOpacity(0.8),
                currentIndex: navigationShell.currentIndex,
                onTap: (index) => navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                ),
                elevation: 0,
                iconSize: 25,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                //showSelectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      navigationShell.currentIndex == 0
                          ? Icons.home
                          : Icons.home_outlined,
                      color: Colors.white,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      navigationShell.currentIndex == 1
                          ? Icons.visibility
                          : Icons.visibility_outlined,
                      color: Colors.white,
                    ),
                    label: 'Watchlist',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      navigationShell.currentIndex == 2
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: Colors.white,
                    ),
                    label: 'Favorites',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      navigationShell.currentIndex == 3
                          ? Icons.star
                          : Icons.star_outline,
                      color: Colors.white,
                    ),
                    label: 'Ratings',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ui_kit/ui_kit.dart';

// class ScaffoldWithNestedNavigation extends StatelessWidget {
//   const ScaffoldWithNestedNavigation({
//     required this.navigationShell,
//     Key? key,
//   }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

//   final StatefulNavigationShell navigationShell;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: navigationShell,
//       resizeToAvoidBottomInset: false,
//       bottomNavigationBar: ClipRRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: ColoredBox(
//             color: AppColors.black.withOpacity(0.55),
//             child: BottomNavigationBar(
//               currentIndex: navigationShell.currentIndex,
//               onTap: (index) => navigationShell.goBranch(
//                 index,
//                 initialLocation: index == navigationShell.currentIndex,
//               ),
//               elevation: 1,
//               iconSize: 25,
//               type: BottomNavigationBarType.fixed,
//               showUnselectedLabels: false,
//               showSelectedLabels: false,
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Icon(
//                     navigationShell.currentIndex == 0
//                         ? Icons.home
//                         : Icons.home_outlined,
//                   ),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(
//                     navigationShell.currentIndex == 1
//                         ? Icons.visibility
//                         : Icons.visibility_outlined,
//                   ),
//                   label: 'Watchlist',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(
//                     navigationShell.currentIndex == 2
//                         ? Icons.favorite
//                         : Icons.favorite_outline,
//                   ),
//                   label: 'Favorites',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(
//                     navigationShell.currentIndex == 3
//                         ? Icons.star
//                         : Icons.star_outline,
//                   ),
//                   label: 'Ratings',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
