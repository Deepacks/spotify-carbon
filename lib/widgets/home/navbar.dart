import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int currentPageIndex;
  final void Function(int) onDestinationSelected;

  const Navbar({
    super.key,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color(0xff100F0F),
      surfaceTintColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      selectedIndex: currentPageIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xff944545),
            ),
            selectedIcon: Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(
              Icons.search,
              color: Color(0xff944545),
            ),
            selectedIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search'),
      ],
    );
  }
}
