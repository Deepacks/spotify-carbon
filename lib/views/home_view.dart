import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/connection_state_provider.dart';
import '../providers/spotify_remote_provider.dart';
import '../providers/secure_storage_provider.dart';
import '../widgets/gradient_container.dart';
import '../widgets/home/home.dart';
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
    final connectionState = ref.read(connectionStateProvider);

    if (!connectionState.connected) {
      final secureStorage = ref.read(secureStorageProvider);

      final token = await spotifyRemote.getAccessToken(
        '75976a3f1c984aaa9eb0d9cb7df73a6d',
        'http://com.bytemeup.spotify_carbon',
        'app-remote-control,user-read-email,user-read-private,user-top-read,user-read-playback-state,user-modify-playback-state,user-read-currently-playing,playlist-read-private,user-read-recently-played,user-library-modify,user-library-read',
      );

      await secureStorage.write(key: 'token', value: token);

      await spotifyRemote.connectToSpotify(
        '75976a3f1c984aaa9eb0d9cb7df73a6d',
        'http://com.bytemeup.spotify_carbon',
      );
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const GradientContainer(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
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
