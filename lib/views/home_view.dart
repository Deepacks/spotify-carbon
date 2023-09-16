import 'package:flutter/material.dart';
import 'package:spotiflutter/spotiflutter.dart';

import '../widgets/home/home.dart';
import '../widgets/home/player_mini.dart';
import '../widgets/gradient_container.dart';
import '../widgets/home/navbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _spotiflutter = Spotiflutter((_) {});

  bool _isRemoteConnected = false;

  @override
  void didChangeDependencies() async {
    _isRemoteConnected = await _spotiflutter.isConnected ?? false;
    if (!_isRemoteConnected) _spotiflutter.connect();
    super.didChangeDependencies();
  }

  int currentPageIndex = 0;
  void onDestinationSelected(int pageIndex) {
    setState(() {
      currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Navbar(
            currentPageIndex: currentPageIndex,
            onDestinationSelected: onDestinationSelected,
          ),
          body: const Stack(
            children: [
              Home(),
              PlayerMini(),
            ],
          ),
        ),
      ),
    );
  }
}
