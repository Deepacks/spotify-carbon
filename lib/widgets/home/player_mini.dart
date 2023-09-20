import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotiflutter/spotiflutter.dart';

import '../../providers/spotify_remote_provider.dart';
import '../../providers/player_state_provider.dart';

import '../glass.dart';
import '../svg_button.dart';

class PlayerMini extends ConsumerWidget {
  const PlayerMini({super.key});

  void togglePlayer(Spotiflutter spotifyRemote, bool isPaused) async {
    if (isPaused) {
      await spotifyRemote.resume();
    } else {
      await spotifyRemote.pause();
    }
  }

  void skipNext(Spotiflutter spotifyRemote) async {
    await spotifyRemote.skipNext();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyRemote = ref.read(spotifyRemoteProvider);
    final playerState = ref.watch(playerStateProvider);

    final isPaused = playerState.isPaused;

    return Positioned(
      left: 10.0,
      bottom: 10.0,
      width: MediaQuery.of(context).size.width - 20,
      child: Glass(
        child: SizedBox(
          height: 95.0,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10.0),
                //   child: Image.network(
                //     'https://cdns-images.dzcdn.net/images/cover/64ec37a4cf512c7810c40ba0d318ff1e/350x350.jpg',
                //   ),
                // ),
                // const SizedBox(width: 13.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playerState.track.name,
                        style: const TextStyle(fontSize: 17),
                      ),
                      Text(
                        playerState.track.artist,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 212, 154, 159),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  leftPadding: isPaused ? 3 : 0,
                  size: isPaused ? 20 : 30,
                  onPressed: () => togglePlayer(
                    spotifyRemote,
                    isPaused,
                  ),
                  assetName: isPaused
                      ? 'assets/icons/play.svg'
                      : 'assets/icons/pause.svg',
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgButton(
                  onPressed: () => skipNext(spotifyRemote),
                  assetName: 'assets/icons/next.svg',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
