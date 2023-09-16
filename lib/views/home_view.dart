import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/spotify_remote_provider.dart';

import '../widgets/gradient_container.dart';
import '../widgets/home/home.dart';
import '../widgets/home/navbar.dart';
import '../widgets/home/player_mini.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void didChangeDependencies() async {
    final spotifyRemote = ref.read(spotifyRemoteProvider);

    final isConnected = await spotifyRemote.isConnected ?? false;
    if (!isConnected) await spotifyRemote.connect();

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
