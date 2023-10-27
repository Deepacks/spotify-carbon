import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotiflutter/web/models/user.dart';

import '../../providers/secure_storage_provider.dart';
import '../../providers/spotify_remote_provider.dart';

class Greeting extends ConsumerStatefulWidget {
  const Greeting({super.key});

  @override
  ConsumerState<Greeting> createState() => _GreetingState();
}

class _GreetingState extends ConsumerState<Greeting> {
  User? user;

  void fetchUser() async {
    final secureStorage = ref.read(secureStorageProvider);
    final token = await secureStorage.read(key: 'token');

    final spotifyRemote = ref.read(spotifyRemoteProvider);

    user = await spotifyRemote.webApi.userApi.getCurrentUserProfile(token!);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int currentHour = now.hour;

    String greeting = ', ${user?.displayName}';

    if (currentHour >= 6 && currentHour < 13) {
      greeting = 'Good morning$greeting';
    } else if (currentHour >= 13 && currentHour < 18) {
      greeting = 'Good afternoon$greeting';
    } else if (currentHour >= 18 && currentHour < 23) {
      greeting = 'Good evening$greeting';
    } else {
      greeting = 'Good night$greeting';
    }

    return Text(
      greeting,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
