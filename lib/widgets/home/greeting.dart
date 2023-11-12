import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotiflutter/web/models/user.dart';

import '../../providers/secure_storage_provider.dart';
import '../../providers/spotify_remote_provider.dart';
import '../page_padding.dart';

class Greeting extends ConsumerStatefulWidget {
  const Greeting({super.key});

  @override
  ConsumerState<Greeting> createState() => _GreetingState();
}

class _GreetingState extends ConsumerState<Greeting> {
  User? user;

  void fetchUser() async {
    final token = await ref.read(secureStorageProvider).read(key: 'token');
    final spotifyRemote = ref.read(spotifyRemoteProvider);

    final r = await spotifyRemote.webApi.userApi.getCurrentUserProfile(token!);

    setState(() {
      user = r;
    });
  }

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int currentHour = now.hour;

    String greeting = '';

    if (currentHour >= 6 && currentHour < 13) {
      greeting = 'Good morning';
    } else if (currentHour >= 13 && currentHour < 18) {
      greeting = 'Good afternoon';
    } else if (currentHour >= 18 && currentHour < 23) {
      greeting = 'Good evening';
    } else {
      greeting = 'Good night';
    }

    if (user != null) {
      greeting = '$greeting, ${user?.displayName}';
    }

    return PagePadding(
      Text(
        greeting,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
