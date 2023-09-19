import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/track_provider.dart';

import '../glass.dart';

class PlayerMini extends ConsumerWidget {
  const PlayerMini({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTrack = ref.watch(trackProvider);

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://cdns-images.dzcdn.net/images/cover/64ec37a4cf512c7810c40ba0d318ff1e/350x350.jpg',
                  ),
                ),
                const SizedBox(width: 13.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentTrack.name,
                      style: const TextStyle(fontSize: 17),
                    ),
                    Text(
                      currentTrack.artist,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 212, 154, 159),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
