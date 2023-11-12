import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotiflutter/web/models/user_top_artists.dart';

import '../../providers/secure_storage_provider.dart';
import '../../providers/spotify_remote_provider.dart';
import 'top_artist_tile.dart';

class TopArtists extends ConsumerStatefulWidget {
  const TopArtists({super.key});

  @override
  ConsumerState<TopArtists> createState() => _TopArtistsState();
}

class _TopArtistsState extends ConsumerState<TopArtists> {
  UserTopArtists? userTopArtists;

  void fetchUserTopArtists() async {
    final token = await ref.read(secureStorageProvider).read(key: 'token');
    final spotifyRemote = ref.read(spotifyRemoteProvider);

    final r = await spotifyRemote.webApi.userApi.getUserTopArtists(token!);

    setState(() {
      userTopArtists = r;
    });
  }

  void playArtist(String uri) async {
    final spotiflutter = ref.read(spotifyRemoteProvider);

    spotiflutter.play(uri);
  }

  @override
  void initState() {
    fetchUserTopArtists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userTopArtists == null
        ? const Text("Loading")
        : SizedBox(
            height: 174,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 20),
                TopArtistTile(userTopArtists!.items[0], playArtist),
                TopArtistTile(userTopArtists!.items[1], playArtist),
                TopArtistTile(userTopArtists!.items[2], playArtist),
                TopArtistTile(userTopArtists!.items[3], playArtist),
                TopArtistTile(userTopArtists!.items[4], playArtist),
              ],
            ),
          );
  }
}
