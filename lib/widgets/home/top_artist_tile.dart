import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotiflutter/web/models/user_top_artists.dart';

class TopArtistTile extends StatelessWidget {
  final UserTopArtistsItem topArtistItem;
  final void Function(String) onArtistPlay;

  const TopArtistTile(
    this.topArtistItem,
    this.onArtistPlay, {
    super.key,
  });

  void handleArtistTap() {
    onArtistPlay(topArtistItem.uri);
  }

  @override
  Widget build(BuildContext context) {
    String? genre;

    if (topArtistItem.genres.isNotEmpty) {
      int randomIndex = Random().nextInt(topArtistItem.genres.length);
      genre = topArtistItem.genres[randomIndex];
    }

    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 120,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: Colors.transparent,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: handleArtistTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                topArtistItem.images.last.url,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              topArtistItem.name,
              style: const TextStyle(fontSize: 17),
            ),
            ...(genre != null
                ? [
                    Text(
                      genre,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 212, 154, 159),
                      ),
                    ),
                  ]
                : [])
          ],
        ),
      ),
    );
  }
}
