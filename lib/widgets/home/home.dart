import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_carbon/providers/connection_state_provider.dart';

import 'greeting.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionState = ref.watch(connectionStateProvider);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 20),
        const Greeting(),
        const SizedBox(
          height: 100,
        ),
        ...(connectionState.connected ? [const Placeholder()] : []),
      ],
    );
  }
}
