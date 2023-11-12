import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/connection_state_provider.dart';
import 'greeting.dart';
import 'top_artists.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(connectionStateProvider).connected;

    return ListView(
      children: [
        const SizedBox(height: 20),
        ...(isConnected
            ? [
                const Greeting(),
                const SizedBox(height: 20),
                const TopArtists(),
              ]
            : []),
      ],
    );
  }
}
