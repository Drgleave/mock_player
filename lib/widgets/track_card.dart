import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_player/models/playlist_model.dart';

import '../models/track_model.dart';

class PlaylistsCard extends StatelessWidget {
  const PlaylistsCard({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/playlist', arguments: playlist);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        //width: MediaQuery.of(context).size.width * 0.45,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              //width: MediaQuery.of(context).size.width * 0.45,
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                playlist.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.37,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        playlist.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${playlist.songs.length} songs',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.deepPurple.shade200,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
